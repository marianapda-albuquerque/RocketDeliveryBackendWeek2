class ChangeCourierIdToAllowNullInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :courier_id, true

  end
end
