require 'spec_helper'

feature "Register a Company" do
  let(:user) {  create(:user) }
  context "as a guest" do

    scenario "redirect to login page" do
      visit new_company_path
      expect(current_path).to eq login_path
    end

  end

  context "as a logged user" do

    scenario "register a valid company" do
      sign_in( user  )
      fill_in "Name", with: "example"
      fill_in "Subdomain", with: "example"

      click_button "Create"

      expect(page).to have_content "Company: example"
      #p request.subdomain
    end

  end


end