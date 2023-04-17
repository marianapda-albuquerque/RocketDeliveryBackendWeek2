class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, :cost, :restaurant, presence: true
  validates :name, uniqueness: { scope: :restaurant_id }
  validates :description, length: { minimum: 5 }, allow_blank: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  
  def as_json(options = {})
    super(options.merge({ except: [:created_at, :updated_at], include: { restaurant: { only: :name } } }))
  end
end
