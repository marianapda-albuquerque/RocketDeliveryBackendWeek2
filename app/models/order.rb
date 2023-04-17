class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  belongs_to :order_status
  belongs_to :courier, optional: true

  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  validates :restaurant_rating, inclusion: { in: [1, 2, 3, 4, 5, nil]}
  validates :restaurant, :customer, :order_status, presence: true
end
