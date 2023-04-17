class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :price_range, inclusion: { in: [1, 2, 3], message: "Invalid rating" }
  validates_associated :products, :orders
  validates :user, :address, :phone, :name, :price_range, :active, presence: true

  
  def self.with_rating_and_price_range(rating, price_range)
    joins(:orders)
      .select("restaurants.id, restaurants.name, restaurants.price_range, (orders.restaurant_rating) as rating")
      .where(price_range: price_range)
    
  end
  
end
