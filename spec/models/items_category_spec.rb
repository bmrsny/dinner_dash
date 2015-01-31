require "rails_helper"

RSpec.describe ItemsCategory, type: :model do
  let(:items_category) { ItemsCategory.new(item_id: 1, category_id: 1) }

  it "is valid" do
    expect(items_category).to be_valid
  end

  it "must have a reference to an item_id" do
    items_category.item_id = nil
    expect(items_category).to_not be_valid
  end

  it "must have a reference to a category" do
    items_category.category_id = nil
    expect(items_category).to_not be_valid
  end

  it "is associated with an item" do
    items_category.category_id
  end

  it "is associated with a category" do
    expect(items_category).to respond_to(:category)
  end

  it "is associated with an item" do
    expect(items_category).to respond_to(:item)
  end
end
