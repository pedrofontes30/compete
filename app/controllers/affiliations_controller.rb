class AffiliationsController < ApplicationController


#before_action :set_time_zone, if: :user_signed_in?


  def new
    @federation = Federation.find(params[:federation_id])
    @affiliation = Affiliation.new(federation_id: params[:federation_id])
    authorize @affiliation
  end

  def create
    # @competition = Competition.find(params[:affiliation][:competition_id])

    federation = Federation.find(params[:federation_id])
    order = Order.create!(amount: federation.affiliation_price, state: 'pending', user: current_user)
    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: federation.name,
        amount: federation.affiliation_price * 100,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(id: order.id, federation_id: params[:federation_id]),
      cancel_url: federation_url(federation)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

    # if params[:affiliation]
    #   @competition = Competition.find(params[:affiliation][:competition_id])
    #   redirect_to competition_path(@competition)
    # else
    #   redirect_to federation_path(@affiliation.federation)
    # end
  end
end
