require 'rails_helper'

describe "user sees a category" do
  describe "navigates to categories from index" do
    before(:each) do
      @category = create(:category)
      @company = create(:company)
      @job = create(:job)
    end
    xit "user sees all categories and jobs associated" do
      visit category_path(@category)

      expect(page).to have_link(@job.title)
      expect(page).to have_content(@category.title)
    end
  end
end
