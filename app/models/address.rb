class Address < ApplicationRecord
    has_many :customers
    has_one :restaurant
    has_many :employees, class_name: "Employee", foreign_key: "address_id", dependent: :destroy
    has_many :couriers
    validates :street_address, :city, :postal_code, presence: true
end
