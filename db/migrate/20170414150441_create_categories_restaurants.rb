class CreateCategoriesRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_restaurants do |t|
      t.belongs_to :category, null: false
      t.belongs_to :restaurant, null: false

      t.timestamps
    end
  end
end
