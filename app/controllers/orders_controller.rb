class OrdersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    authorize! :read, user
    @orders = user.orders
  end

  def show
    @order = Order.find(params[:id])
    authorize! :read, @order
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @order = Order.create(
                          status: "ordered",
                          total: @cart.total * 100,
                          user_id: @user.id
                          )
    items = Item.find(@cart.data.keys)
    @line_items = items.map do |item|
      OrdersItem.create(
                        order_id: @order.id,
                        item_id: item.id,
                        quantity: @cart.data[item.id.to_s],
                        subtotal: item.price * @cart.data[item.id.to_s]
                        )
    end
    session[:cart] = nil
    redirect_to user_order_path(@user, @order)
  end
end
