require "rails_helper"

feature "Admin User" do
  background do
    @category = Category.create(name: "Meat", description: "Bacon! Bacon! Bacon!")
    @admin_user = User.create(fullname: "frank", email: "frank@aol.com", role: "admin", password: "foobar1234", password_confirmation: "foobar1234", display_name: "franky")
  end

  scenario "Admin User can see a list of Categories" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
                                                 and_return(@admin_user)
    visit admin_categories_path
    expect(page).to have_content("Meat")
  end

  scenario "Admin User can create a new Category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(@admin_user)
    visit admin_categories_path
    click_link_or_button "Create New Category"
    expect(current_path).to eq(new_admin_category_path)
    expect(page).to have_content("New Category")
    fill_in "category[name]", with: "Veggie"
    fill_in "category[description]", with: "Non-meat items"
    click_link_or_button "Save"
    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Veggie")
  end

  scenario "Admin User can edit a current Category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(@admin_user)
    visit admin_categories_path
    click_link_or_button "Edit"
    # expect(current_path).to eq(edit_admin_category_path)
    fill_in "category[name]", with: "Veggie2"
    fill_in "category[description]", with: "Non-meaty items"
    click_link_or_button "Save"
    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Veggie2")
  end

  scenario "Admin User can delete a current Category" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(@admin_user)
    visit admin_categories_path
    click_link "Delete"
    expect(current_path).to eq(admin_categories_path)
    # expect(page).to have_content("Are you sure?")
    expect(current_path).to eq(admin_categories_path)
    expect(page).not_to have_content("Meat")
  end

  scenario "Admin can see admin control footer" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(@admin_user)
    visit "/"
    within("footer") do
      expect(page).to have_content("Administrator Controls")
    end
  end

  scenario "Admin can visit see all orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(@admin_user)
    visit "/"
    expect(page).to have_content("Manage Customer Orders")
    click_link_or_button("Manage Customer Orders")
    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("ordered")
    expect(page).to have_content("paid")
  end
end
