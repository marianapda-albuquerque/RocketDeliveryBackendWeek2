class ChangeAddressColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :addresses, :street_address, false
    change_column_null :addresses, :city, false
    change_column_null :addresses, :postal_code, false
  end
end
