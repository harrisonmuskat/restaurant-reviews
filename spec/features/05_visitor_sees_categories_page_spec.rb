require 'rails_helper'

# [] Visiting the `/categories` path should contain a list of categories.

feature "visitor sees a list of categories" do
  scenario "sees a list of categories" do
    Category.create!(category: "Thai")
    Category.create!(category: "Mexican")
    Category.create!(category: "Armenian")

    visit restaurants_path

    expect(page).to have_link "Restaurant Categories"

    click_link "Restaurant Categories"

    expect(page).to have_content "Restaurant Categories"
    expect(page).to have_content "Thai"
    expect(page).to have_content "Mexican"
    expect(page).to have_content "Armenian"
  end

end
