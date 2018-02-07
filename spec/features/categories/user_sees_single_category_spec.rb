require 'rails_helper'

describe "user sees a category" do
  describe "navigates to categories from index" do
    it "user sees all categories and jobs associated" do
      @job = create(:job)
      @category = Category.find(@job.category.id)
      visit category_path(@category)

      expect(page).to have_link(@job.title)
      expect(page).to have_content(@category.title)
    end
  end
end
