require 'rails_helper'

# On the page for a restaurant's details, I should see all the categories that a restaurant belongs to.
# Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.

feature "visitor sees list of categories on restaurant page" do
  scenario "sees reviews for specific restaurant" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    thai_category = Category.create(category: "Thai")
    japanese_category = Category.create(category: "Japanese")
    dumpling_king.categories << thai_category
    dumpling_king.categories << japanese_category

    visit restaurant_path(dumpling_king)

    expect(page).to have_content dumpling_king.name
    expect(page).to have_content thai_category.category
    expect(page).to have_content japanese_category.category
  end

  scenario "visitor clicks category to see other restaurants with same category" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    rock_bottom = Restaurant.create(name: "Rock Bottom", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")
    thai_category = Category.create(category: "Thai")
    japanese_category = Category.create(category: "Japanese")
    dumpling_king.categories << thai_category
    dumpling_king.categories << japanese_category
    rock_bottom.categories << thai_category

    visit restaurant_path(dumpling_king)

    click_link "Thai"

    expect(page).to have_content "Thai Restaurants"
    expect(page).to have_content "Dumpling King"
    expect(page).to have_content "Rock Bottom"
  end
end
