require 'rails_helper'

describe "user creates new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Music Production"
    click_on "Create Category"

    expect(page).to have_content("Music Production")
  end

  scenario "user tries to create category that already exists" do
    Category.create!(title: 'Author')
    visit new_category_path

    fill_in "category[title]", with: "Author"
    click_on "Create Category"
    expect(current_path).to eq(new_category_path)
    expect(page).to have_content("Category already exists")
  end
end
