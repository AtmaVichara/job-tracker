require "rails_helper"

describe "user can delete a job" do
  describe "user navigates to job show page" do
    it "user deletes job" do
      company = Company.create!(name: 'Gusto')
      category = Category.create!(title: "Panda Engineering")
      job = company.jobs.create!(title: "Developer", city: 'Denver', level_of_interest: 60, category_id: category.id)
      job2 = company.jobs.create!(title: "Panda Groomer", city: "Australia", level_of_interest: 90, category_id: category.id)

      visit job_path(job)
      click_on "Delete"

      expect(page).to_not have_link("Developer")
      expect(page).to have_link("Panda Groomer")
    end
  end
end
