class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @registration = Registration.new
    authorize @registration
    @divisions = CompetitionDivision.where(competition: @competition)
  end

  def create
    competition_division = CompetitionDivision.find(params[:registration][:competition_division_id])
    #redirect_to competition_path(params[:competition_id])
    order = Order.create!(amount: competition_division.competition.registration_price, state: 'pending', user: current_user)
    authorize order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: competition_division.competition.name,
        amount: (order.amount * 100).to_i,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(id: order.id, competition_division_id: competition_division.id),
      cancel_url: competition_url(competition_division.competition)
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
