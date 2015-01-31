require "rails_helper"

feature "unathenticated Users can see a list of items" do
  background do
    @category = Category.create(name: "Meaty", description: "Hot! Hot! Hot!")
    @item = Item.create(title: "Hot n Spicy", description: "All the hot and spicy things you can handle", price: 1000)
    @category.items << @item
  end

  scenario "User can see a list of all items" do
    visit items_path
    expect(page).to have_content("Hot n Spicy")
  end

  scenario "User can see a list of all spicy items" do
    visit "/"
    click_link_or_button "Meaty"
    expect(current_path).to eq(category_path(@category))
    expect(page).to have_content("Hot n Spicy")
  end

  scenario "User can add item to cart from category page" do
    visit category_path(@category)
    click_link_or_button "Add to Cart"
    within("#flash_notice") do
      "You have 1, Hot n Spicy in your cart."
    end
  end

  scenario "User can not visit Admin pages" do
    visit admin_categories_path
    expect(current_path).to eq(root_path)
  end
end
