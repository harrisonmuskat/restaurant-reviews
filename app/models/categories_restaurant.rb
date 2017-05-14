class CategoriesRestaurant < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant

  validates :category, presence: true
  validates :restaurant, presence: true
  validates :restaurant_id, uniqueness: { scope: :category }
end
