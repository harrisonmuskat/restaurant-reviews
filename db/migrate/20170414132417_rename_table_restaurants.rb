class RenameTableRestaurants < ActiveRecord::Migration[5.0]
  def up
    rename_table :table_restaurants, :restaurants
  end
  def down
    rename_table :restaurants, :table_restaurants
  end
end
