class ChangeRestaurantColumnsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :restaurants, :user_id, false
    change_column_null :restaurants, :address_id, false
    # add_index :restaurants, :address_id, unique: true
    change_column_null :restaurants, :phone, false
    change_column_null :restaurants, :name, false
    change_column_default :restaurants, :price_range, 1
    change_column_null :restaurants, :price_range, false
    change_column_default :restaurants, :active, true
    change_column_null :restaurants, :active, false
  end
end
