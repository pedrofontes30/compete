class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @registration = Registration.new
    authorize @registration
    @divisions = CompetitionDivision.where(competition: @competition)
  end

  def create
    @registration = Registration.new(registration_params)
    authorize @registration
    @registration.user = current_user
    @registration.price = @registration.competition.registration_price
    @registration.save!
    @registration.competition_division.create_heats
    if UserFederationDivisionScore.where(user: current_user, federation: @registration.competition_division.competition.federation) == []
      UserFederationDivisionScore.create(user: current_user, federation: @registration.competition_division.competition.federation)
    end
    #redirect_to competition_path(params[:competition_id])
    order = Order.create!(registration: @registration, amount: @registration.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @registration.competition.name,
        amount: @registration.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @registration = Registration.new(registration_params)
    authorize @registration
    @affiliated = current_user.present? ? Affiliation.where(user: current_user, federation: @competition.federation) != [] : nil
  end

  private

  def registration_params
    params.require(:registration).permit(:competition_division_id)
  end
end
