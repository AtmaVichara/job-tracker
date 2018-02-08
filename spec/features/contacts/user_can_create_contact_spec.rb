require 'rails_helper'

describe "user can create contact" do
  describe "user navigates to company show page" do
    it "user creates contact" do
      company = create(:company)
      visit company_path(company)

      fill_in 'contact[full_name]', with: 'Nergal'
      fill_in 'contact[position]', with: 'Frontman of Behemoth'
      fill_in 'contact[email]', with: 'allHailDionysis@getfunky.net'
      click_on "Create Contact"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("Nergal")
      expect(page).to have_content("Frontman of Behemoth")
      expect(page).to have_content("allHailDionysis@getfunky.net")
    end
  end
end
