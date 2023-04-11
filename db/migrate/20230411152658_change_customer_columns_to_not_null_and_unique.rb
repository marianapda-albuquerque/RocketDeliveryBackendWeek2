class ChangeCustomerColumnsToNotNullAndUnique < ActiveRecord::Migration[7.0]
  def change
    change_column_null :customers, :user_id, false
    remove_index :customers, :user_id
    add_index :customers, :user_id, unique: true
    change_column_null :customers, :address_id, false
    change_column_null :customers, :phone, false
    change_column_default :customers, :active, true
  end
end
