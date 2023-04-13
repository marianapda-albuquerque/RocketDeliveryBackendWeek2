class AddUniqueIndexToEmployeesUserId < ActiveRecord::Migration[7.0]
  def change
    remove_index :employees, :user_id
    add_index :employees, :user_id, unique: true
  end
end
