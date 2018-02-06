require 'rails_helper'

describe "a user can delete a category" do
  describe "user navigates to category index" do
    scenario "user deletes category" do
      category1 = Category.create!(title: "LADDERS")
      category2 = Category.create!(title: "Enuma Elish")

      visit categories_path
      find(".LADDERS").click_on "Delete"

      expect(page).to_not have_content(category1.title)
      expect(page).to have_content(category2.title)
    end
  end
end
