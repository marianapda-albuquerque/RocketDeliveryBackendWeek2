class ChangeCourierIdToNotNullInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :courier_id, false

  end
end
