require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    save_and_open_page

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  describe "a user links from jobs index" do
    scenario "user sees a job for specific company" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job2 = company.jobs.create!(title: "Teacher", level_of_interest: 80, city: "Denver")

      visit company_jobs_path(company)

      click_link job2.title

      expect(page).to have_content("Teacher")
      expect(page).to have_content("ESPN")
      expect(page).to have_content("80")
    end
  end
end
