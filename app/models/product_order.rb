class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  # validate :same_restaurant?

  # def same_restaurant?
  #   unless order.restaurant == product.restaurant
  #     errors.add(:product_id, "must belong to the same restaurant as the order")
  #   end
  # end
end
