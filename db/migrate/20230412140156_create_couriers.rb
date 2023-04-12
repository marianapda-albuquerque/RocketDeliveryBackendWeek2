class CreateCouriers < ActiveRecord::Migration[7.0]
  def change
    create_table :couriers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :courier_status, null: false, foreign_key: true
      t.string :phone
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
