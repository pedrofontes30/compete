class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
    @order.update(state: 'paid')
    authorize @order
  end
end
