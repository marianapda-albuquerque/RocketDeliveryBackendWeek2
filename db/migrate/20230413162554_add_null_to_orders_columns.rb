class AddNullToOrdersColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :courier_id, :bigint, default: nil
    change_column :orders, :restaurant_rating, :integer, default: nil
  end
end
