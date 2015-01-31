module Admin
  class OrdersController < ApplicationController
    def index
      @orders = { ordered: Order.ordered,
                  paid: Order.paid,
                  completed: Order.completed,
                  cancelled: Order.cancelled
                }
      @all_orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
      @user = User.find(@order.user_id)
    end

    def update
      @order = Order.find(params[:id])
      if params[:commit] == "cancel"
        @order.update(status: "cancelled")
        redirect_to admin_orders_path
      elsif params[:commit] == "mark as paid"
        @order.update(status: "paid")
        redirect_to admin_orders_path
      elsif params[:commit] == "mark as completed"
        @order.update(status: "completed")
        redirect_to admin_orders_path
      end
    end
  end
end
