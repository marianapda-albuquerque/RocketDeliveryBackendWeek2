class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :orders, dependent: :nullify

  validates :user, :address, :phone, :active, presence: true
end
