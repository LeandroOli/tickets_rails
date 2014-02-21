require 'spec_helper'

feature "Sign up" do

  context "click signup link" do
    before(:each) do
      visit root_path
    end
    after(:each) do
      expect(current_path).to eq signup_path
      expect(page).to have_content "Sign up"
    end
    scenario "from menu" do
      click_link "Sign up"
    end
    scenario "from page" do
      click_link "Sign up today"
    end
  end

  context "with" do
    before(:each) do
      visit signup_path
    end
    scenario "valid user" do
      fill_in "Username", with: "example"
      fill_in "Email", with: "example@example.com"
      fill_in "Name", with: "example"
      fill_in "user[password]", with: "secret"
      fill_in "user[password_confirmation]", with: "secret"

      click_button "Sign up"

      expect(current_path).to eq new_company_path #needs create a company after user signup
      expect(page).to have_content "Dashboard"
      expect(page).to_not have_content "Login"
    end

    scenario "invalid user" do
      click_button "Sign up"

      expect(current_path).to_not eq root_path
      expect(page).to_not have_content "Dashboard"
      expect(page).to have_content "Login"
    end

  end


end