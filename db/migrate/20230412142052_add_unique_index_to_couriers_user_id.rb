class AddUniqueIndexToCouriersUserId < ActiveRecord::Migration[7.0]
  def change
    remove_index :couriers, :user_id
    add_index :couriers, :user_id, unique: true
  end
end
