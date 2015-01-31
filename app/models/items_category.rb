class ItemsCategory < ActiveRecord::Base
  validates :item_id, :category_id, presence: true
  belongs_to :category
  belongs_to :item
end
