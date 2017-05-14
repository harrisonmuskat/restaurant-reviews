require 'rails_helper'

# Should see the name of the category at the top of the page.
# Should see the name of all restaurants that belong to this category.
# Should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
# Should get to this page by clicking on the name of a category while on the page with the names of all the categories.

feature "visitor views a single category page" do
  scenario "sees a list of restaurants with that category" do
    thai_category = Category.create(category: "Thai")
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    rock_bottom = Restaurant.create(name: "Rock Bottom", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")
    dumpling_king.categories << thai_category

    visit categories_path

    expect(page).to have_link "Thai restaurants"

    click_link "Thai restaurants"

    expect(page).to have_content "Thai Restaurants"
    expect(page).to have_content "Dumpling King"
    expect(page).to_not have_content "Rock Bottom"
  end

  scenario "visits a restaurant page from the specific category page" do
    thai_category = Category.create(category: "Thai")
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    dumpling_king.categories << thai_category

    visit categories_path

    expect(page).to have_link "Thai restaurants"

    click_link "Thai restaurants"
    click_link "Dumpling King"

    expect(page).to have_content "Dumpling King"
    expect(page).to have_link "Add a Review"
  end

end
