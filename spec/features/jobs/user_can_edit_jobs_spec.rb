require 'rails_helper'

describe "user can edit job" do
  describe "user navigates to job show page" do
    it "user edits job" do
      company = Company.create!(name: 'Gusto')
      job = company.jobs.create!(title: "Developer", city: 'Denver', level_of_interest: 60)

      visit company_job_path(company, job)

      click_on "Edit"

      fill_in "job[title]", with: "Sausage Prep Cook"
      fill_in "job[city]", with: "Nashville"
      fill_in "job[level_of_interest]", with: 90
      click_on "Update Job"

      expect(page).to have_content("Sausage Prep Cook")
      expect(page).to have_content("Nashville")
    end
  end
end
