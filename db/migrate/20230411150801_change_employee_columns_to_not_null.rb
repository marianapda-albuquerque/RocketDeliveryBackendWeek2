class ChangeEmployeeColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :employees, :user_id, false
    change_column :employees, :user_id, :bigint, unique: true
    change_column_null :employees, :address_id, false
    change_column_null :employees, :phone, false
  end
end
