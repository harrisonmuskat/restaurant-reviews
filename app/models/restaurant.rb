class Restaurant < ApplicationRecord
  has_many :categories_restaurants
  has_many :categories, through: :categories_restaurants
  has_many :reviews

  validates :name, uniqueness: { scope: :address }
  validates :name, :address, :city, :state, :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :zip, numericality: true
end
