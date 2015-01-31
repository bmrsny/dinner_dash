require "rails_helper"

feature "Add Items to Cart" do
  background do
    @item = Item.create(
      title: "Green Burrito",
      description: "A tasty burrito for your mouth.",
      price: 800
    )
    @user = User.create(
      fullname: "Frank",
      email: "frank@gmail.com",
      role: "default",
      password: "password",
      password_confirmation: "password"
    )
  end

  scenario "an item has a cart button" do
    visit items_path
    within("table") do
      expect(page).to have_button("Add to Cart")
    end
  end

  scenario "user can add item to cart" do
    visit items_path
    click_button("Add to Cart")
    within("#cart") do
      expect(page).to have_content("1")
    end
  end

  scenario "user can view their cart" do
    visit items_path
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_link("2")
    within("#cart_table") do
      expect(page).to have_content("Qty")
      expect(page).to have_content("$16.00")
    end
  end

  scenario "user can delete item from cart" do
    visit items_path
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_link("2")
    click_button("Delete")
    within("#cart") do
      expect(page).to have_content("0")
    end
    within("#cart_table") do
      expect(page).to_not have_content("1")
      expect(page).to_not have_content("$8.00")
    end
  end

  scenario "user can update quantity of item in cart" do
    visit items_path
    click_button("Add to Cart")
    click_link("1")
    fill_in "qty", with: "2"
    click_button("Update Qty")
    within("#cart_table") do
      expect(page).to have_content("$16.00")
      expect(page).to_not have_content("$8.00")
    end
  end

  scenario "authenticated user can checkout" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                 and_return(@user)
    visit items_path
    click_button("Add to Cart")
    click_link("1")
    click_button("Checkout")
    within("#cart") do
      expect(page).to have_content("0")
    end
  end

  scenario "unauthorized user cannot checkout" do
    visit items_path
    click_button("Add to Cart")
    click_link("1")
    click_button("Checkout")
    expect(page).to_not have_content("Status: ordered")
  end
end
