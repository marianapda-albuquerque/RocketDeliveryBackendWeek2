class Address < ApplicationRecord
    has_many :customers
    has_one :restaurant
    has_many :employee
end
