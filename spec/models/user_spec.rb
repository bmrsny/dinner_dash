require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {
    User.create(
                fullname: "Daisy",
                display_name: "lildaisy",
                email: "daisy@example.com",
                password: "password",
                role: "default"
                )
  }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is not valid without a fullname" do
    user.fullname = nil
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a unique email" do
    user
    user_2 = User.new(
                      fullname: "Daisy",
                      display_name: "lildaisy",
                      email: "daisy@example.com",
                      password: "password",
                      role: "default"
                      )
    expect(user_2).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a role" do
    user.role = nil
    expect(user).to_not be_valid
  end

  it "is not valid with a display name under 2 characters" do
    user_2 = User.new(
                      fullname: "Daisy",
                      display_name: "l",
                      email: "daisy@example.com",
                      password: "password",
                      role: "default"
                      )
    expect(user_2).to_not be_valid
  end

  it "is not valid with a display name over 32 characters" do
    user_2 = User.new(
                      fullname: "Daisy",
                      display_name: "llskdjflawierlansvllaiwjekajdsfljkwelkjla",
                      email: "daisy@example.com",
                      password: "password",
                      role: "default"
                      )
    expect(user_2).to_not be_valid
  end

  it "is valid without a display name" do
    user.display_name = nil
    expect(user).to be_valid
  end

  it "can have many orders" do
    user.orders.create(status: "pending", total: "2434")
    expect(user.orders.map(&:user_id)).to eq([user.id])
  end
end
