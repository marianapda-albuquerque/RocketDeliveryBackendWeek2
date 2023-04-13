class Courier < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :courier_status
  
  has_many :orders
  validates_associated :orders
  validates :user, :address, :phone, :courier_status, :active, presence: true
end
