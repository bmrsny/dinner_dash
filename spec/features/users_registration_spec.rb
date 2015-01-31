require "rails_helper"

feature "User can register" do
  scenario "User can register with valid credentials" do
    visit "/"
    click_link_or_button "Register"
    visit "/register"
    fill_in "user[fullname]", with: "Jim Bob"
    fill_in "user[email]", with: "jimbob@gmail.com"
    fill_in "user[password]", with: "foobar12"
    fill_in "user[password_confirmation]", with: "foobar12"
    fill_in "user[display_name]", with: "frankyboi"
    click_link_or_button "Sign Up"
    within("#user_nav") do
      expect(page).to have_content("Welcome, Jim Bob")
    end
  end
end
