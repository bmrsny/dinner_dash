class OrdersItem < ActiveRecord::Base
  validates :quantity, :subtotal, presence: true
  belongs_to :item
  belongs_to :order
end
