class ChangeCourierDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :couriers, :courier_status_id, 1
    change_column_default :couriers, :active, true
  end
end
