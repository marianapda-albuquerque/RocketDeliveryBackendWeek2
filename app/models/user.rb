class User < ApplicationRecord
  has_one :customer
  has_many :restaurants
  has_one :employee
  has_one :courier
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_associated :employee, :customer, :courier, :restaurants
  validates :name, :email, :encrypted_password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
