require "rails_helper"

feature "User login" do
  let(:default_user_attributes) { { fullname: "jimbobfrank", email: "jimbobfrank@aol.com", role: "default", password: "foobar1234", password_confirmation: "foobar1234", display_name: "frankyboy" } }
  let(:admin_user_attributes) { { fullname: "frank", email: "frank@aol.com", role: "admin", password: "foobar1234", password_confirmation: "foobar1234", display_name: "franky" } }
  let(:protected_user_attributes) { { fullname: "bob", email: "bob@aol.com", role: "default", password: "pass", password_confirmation: "pass", display_name: "bob" } }
  let!(:user) { User.create(default_user_attributes) }
  let(:admin_user) { User.create(admin_user_attributes) }
  let(:protected_user) { User.create(protected_user_attributes) }

  scenario "User can Welcome Page" do
    visit "/"
    expect(page).to have_content("Are you")
  end

  scenario "User can sign in with correct credentials" do
    visit "/"
    within("#session") do
      fill_in "session[email]", with: "jimbobfrank@aol.com"
      fill_in "session[password]", with: "foobar1234"
    end
    click_link_or_button "Login"
    within("#user_nav") do
      expect(page).to have_content("Welcome, jimbobfrank")
    end
  end

  scenario "unregistered user cannot login" do
    visit "/"
    within("#session") do
      fill_in "session[email]", with: "XXjimbobfrank@aol.com"
      fill_in "session[password]", with: "XXfoobar1234"
    end
    click_link_or_button "Login"
    expect(page).to have_content("Invalid login")
  end

  scenario "registered user cannot view other user information" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                  and_return(user)
    visit user_orders_path(protected_user)
    within("#flash_alert") do
      expect(page).to have_content("You are not authorized to access this page")
    end
  end

  scenario "an admin can view other users information" do
    order = user.orders.create(status: "completed", total: 1000)
    item = Item.create(title: "Two Torpedo Tacos", description: "Two crispy chicken tacos.", price: 500)
    order1_item1 = OrdersItem.create(item_id: item.id, order_id: order.id, quantity: 2, subtotal: 1000)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin_user)
    visit user_orders_path(user)
    within("#orders") do
      expect(page).to have_content("Orders")
      expect(page).to have_content("Order#")
    end
    click_link_or_button "Order#"
    expect(page).to have_content("Order Total")
    expect(current_path).to eq(user_order_path(admin_user, order))
  end
end
