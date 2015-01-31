require 'rails_helper'

RSpec.describe OrdersItem, :type => :model do
  let (:order) { Order.create(user_id: 1, status: "ordered", total: 1700)}
  let (:item) { Item.create(title: "Green Chili Burrito", description:"Amazingly spicey burrito", price:655, image: "image/path")}
end
