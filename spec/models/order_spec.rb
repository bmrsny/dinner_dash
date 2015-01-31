require 'rails_helper'

RSpec.describe Order, :type => :model do
  let (:order) { Order.create(user_id: 1, status: "ordered", total: 1700)}
  let (:item) { Item.create(title: "Green Chili Burrito", description:"Amazingly spicey burrito", price:655, image: "image/path")}

  it "is valid" do
    expect(order).to be_valid
  end

  it "is invalid without a user_id" do
    order.user_id = nil
    expect(order).to be_invalid
  end

  it "is invalid without a status" do
    order.status = nil
    expect(order).to be_invalid
  end

  it "is invalid without a total" do
    order.total = nil
    expect(order).to be_invalid
  end

  it "returns an empty items array" do
    expect(order.items).to eq([])
  end

  it "responds to items" do
    expect(order).to respond_to(:items)
  end

  it "is associated with a user" do
    expect(order).to respond_to(:user)
  end
end
