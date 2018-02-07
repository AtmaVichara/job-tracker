require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Engineering")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    comment_1 = job.comments.create(author_name: "Grunkle Stan", body: "There are no monsters")
    comment_2 = job.comments.create(author_name: "Bill Cipher", body: "I will rule the world")

    visit company_job_path(company, job)
    
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(comment_1.author_name)
    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_2.author_name)
    expect(page).to have_content(comment_2.body)
  end

  describe "a user links from jobs index" do
    scenario "user sees a job for specific company" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Engineering")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job2 = company.jobs.create!(title: "Teacher", level_of_interest: 80, city: "Denver", category_id: category.id)

      visit company_jobs_path(company)

      click_link job2.title

      expect(page).to have_content("Teacher")
      expect(page).to have_content("ESPN")
      expect(page).to have_content("80")
    end
  end
end
