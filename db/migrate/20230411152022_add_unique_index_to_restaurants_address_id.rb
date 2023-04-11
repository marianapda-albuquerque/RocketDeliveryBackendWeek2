class AddUniqueIndexToRestaurantsAddressId < ActiveRecord::Migration[7.0]
  def change
    remove_index :restaurants, :address_id
    add_index :restaurants, :address_id, unique: true, where: "address_id IS NOT NULL"
  end
end
