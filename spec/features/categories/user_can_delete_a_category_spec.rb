require 'rails_helper'

describe "a user can delete a category" do
  describe "user navigates to category index" do
    scenario "user deletes category" do
      category = Category.create!(title: "LADDERS")
      category = Category.create!(title: "Enuma Elish")

      visit categories_path

      click_on "Delete"

      expect(page).to_not have_content("LADDERS")
      expect(page).to have_content("LADDERS")
    end
  end
end
