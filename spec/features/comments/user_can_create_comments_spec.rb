require 'rails_helper'

describe 'user fills in comment form' do
  it 'displays comment in job show page' do
    job = create(:job)

    visit company_job_path(job.company, job)

    fill_in "comment[author_name]", with: "Aang"
    fill_in "comment[body]", with: "This jobs alright. Sucks having Zuko chase you though."
    click_on "Submit"

    expect(current_path).to eq(company_job_path(job.company, job))
    expect(page).to have_content("Aang")
    expect(page).to have_content("This jobs alright. Sucks having Zuko chase you though.")
  end
end
