class Category < ApplicationRecord
  has_many :categories_restaurants
  has_many :restaurants, through: :categories_restaurants

  validates :category, presence: true
  validates :category, uniqueness: true
end
