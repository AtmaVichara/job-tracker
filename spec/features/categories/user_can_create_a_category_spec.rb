require 'rails_helper'

describe "user creates new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Music Production"
    click_on "Create Category"

    expect(page).to have_content("Music Production")
  end
end
