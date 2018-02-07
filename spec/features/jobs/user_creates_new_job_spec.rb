require 'rails_helper'

describe "User creates a new job" do
  it "a user can create a new job" do
    category = create(:category)
    company = create(:company)
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    find('select').find(:xpath, '//*[@id="job_category_id"]/option').select_option

    click_on "Create Job"

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
