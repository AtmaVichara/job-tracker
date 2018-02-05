require 'rails_helper'

describe "user sees all categories" do
  describe "user goes to categories index" do
    it 'sees all categories' do
      category1 = Category.create!(title: "Finance")
      category2 = Category.create!(title: "Engineering")
      category3 = Category.create!(title: "Fabric Therapy")

      visit categories_path

      expect(page).to have_content(category1.title)
      expect(page).to have_content(category2.title)
      expect(page).to have_content(category3.title)
    end
  end
end
