require "rails_helper"

describe "a user edits a category" do
  describe "user navigates to categories index" do
    scenario "user edits a category" do
      category = Category.create!(title: "Panda Care")

      visit categories_path

      click_on "Edit"

      fill_in 'category[title]', with: "Red Panda Grooming"
      click_on "Update Category"

      expect(page).to have_content("Red Panda Grooming")
    end
  end
end
