class CreateOrdersItems < ActiveRecord::Migration
  def change
    create_table :orders_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
