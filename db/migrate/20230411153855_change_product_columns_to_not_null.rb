class ChangeProductColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :restaurant_id, false
    change_column_null :products, :name, false
    change_column_null :products, :cost, false
    change_column :products, :cost, :integer, null: false, default: 0, check: "cost >= 0"
  end
end
