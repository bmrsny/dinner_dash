module AdminOrdersHelper
  def change_status
    set_order
    case params_commit
    when "cancel"
      update_order("cancelled")
    when "mark as paid"
      update_order("paid")
    when "mark as completed"
      update_order("completed")
    end
    redirect_to admin_orders_path
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def update_order(status)
    @order.update(status: status)
  end

  private
  
  def params_commit
    params[:commit]
  end
end
