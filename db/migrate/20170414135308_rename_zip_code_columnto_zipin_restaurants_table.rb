class RenameZipCodeColumntoZipinRestaurantsTable < ActiveRecord::Migration[5.0]
  def up
    rename_column :restaurants, :zipcode, :zip
  end
  def down
    rename_column :restaurants, :zip, :zipcode
  end
end
