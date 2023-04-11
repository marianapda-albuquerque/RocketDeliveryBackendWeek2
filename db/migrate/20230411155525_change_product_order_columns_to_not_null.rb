class ChangeProductOrderColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :product_orders, :order_id, false
    change_column_null :product_orders, :product_quantity, false
    change_column :product_orders, :product_quantity, :integer, null: false, default: 1, limit: 1
    change_column_null :product_orders, :product_unit_cost, false
    change_column :product_orders, :product_unit_cost, :integer, null: false, default: 0
  end
end
