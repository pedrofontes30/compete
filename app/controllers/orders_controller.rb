def create
  registration = Registration.find(params[:user_id])
  order  = Order.create!(registration: registration, registration_sku: registration.sku, amount: registration.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: registration.sku,
      #images: [teddy.photo_url],
      amount: registration.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)

  def show
    @order = current_user.orders.find(params[:id])
  end

end
