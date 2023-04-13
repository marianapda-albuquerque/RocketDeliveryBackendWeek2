class AddDefaultNullValueToCourierIdInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :courier_id, from: nil, to: 0
    change_column_null :orders, :courier_id, true
  end
end
