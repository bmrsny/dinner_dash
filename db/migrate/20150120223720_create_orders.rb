class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :users_id
      t.string :status
      t.integer :total

      t.timestamps null: false
    end
  end
end
