class RemoveColumnUsersIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :users_id, :integer
  end

  def down
    add_column :orders, :user_id, :integer
  end
end
