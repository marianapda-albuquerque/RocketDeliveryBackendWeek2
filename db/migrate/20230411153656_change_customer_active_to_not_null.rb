class ChangeCustomerActiveToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :customers, :active, false
  end
end
