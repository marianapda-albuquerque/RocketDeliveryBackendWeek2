class ChangeCouriersColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :couriers, :user_id, false
    change_column_null :couriers, :address_id, false
    change_column_null :couriers, :courier_status_id, false
    change_column_null :couriers, :phone, false
    change_column_null :couriers, :active, false
  end
end
