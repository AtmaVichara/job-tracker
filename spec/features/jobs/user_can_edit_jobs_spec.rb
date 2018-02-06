require 'rails_helper'

describe "user can edit job" do
  describe "user navigates to job show page" do
    xit "user edits job" do
      company = Company.create!(name: 'Gusto')
      category = Category.create!(title: "Panda Groomer")
      job = company.jobs.create!(title: "Developer", city: 'Denver', level_of_interest: 60, category_id: category.id)

      visit company_job_path(company, job)

      click_on "Edit"

      fill_in "job[title]", with: "Sausage Prep Cook"
      fill_in "job[city]", with: "Nashville"
      fill_in "job[level_of_interest]", with: 90
      save_and_open_page
      find('select').find(:xpath, '//*[@id="job_category_id"]/option').select_option
      click_on "Update Job"

      expect(page).to have_content("Sausage Prep Cook")
      expect(page).to have_content("Nashville")
    end
  end
end
