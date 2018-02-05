require "rails_helper"

describe "user can delete a job" do
  describe "user navigates to job show page" do
    it "user deletes job" do
      company = Company.create!(name: 'Gusto')
      job = company.jobs.create!(title: "Developer", city: 'Denver', level_of_interest: 60)
      job2 = company.jobs.create!(title: "Panda Groomer", city: "Australia", level_of_interest: 90)

      visit company_job_path(company, job)

      click_on "Delete"

      expect(page).to not_have("Developer")
      expect(page).to have("Panda Groomer")
    end
  end
end
