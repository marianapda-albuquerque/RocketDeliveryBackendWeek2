class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, :description, :cost, :restaurant, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  
end
