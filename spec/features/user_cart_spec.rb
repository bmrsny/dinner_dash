require "rails_helper"

feature "Add Items to Cart" do
  background do
    @item = Item.create(
      title: "Green Burrito",
      description: "A tasty burrito for your mouth.",
      price: 800,
      image: "burrito.jpg"
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
      expect(page).to have_content("2")
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
end