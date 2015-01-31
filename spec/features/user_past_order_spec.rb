require "rails_helper"

feature "Past Orders" do

  scenario "a user can view his orders" do
    user = User.create(fullname: "Jeff Casmir", email: "demo+jeff@jumpstartlab.com", display_name: "j3", password: "password", role: 0)
    order = user.orders.create(status: "completed", total: 1000)
    item = Item.create(title: "Two Torpedo Tacos", description: "Two crispy chicken tacos.", price: 500)
    order1_item1 = OrdersItem.create(item_id: item.id, order_id: order.id, quantity: 2, subtotal: 1000)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                          and_return(user)
    visit user_orders_path(user)
    within("#orders") do
      expect(page).to have_content("Orders")
      expect(page).to have_content("Order#")
    end

    click_link_or_button "Order#"
    expect(page).to have_content("Order Total")
    expect(current_path).to eq(user_order_path(user, order))
  end
end
