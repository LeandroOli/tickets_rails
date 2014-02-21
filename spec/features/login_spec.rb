require 'spec_helper'

feature "Login" do
  let(:admin_user) { create(:admin_user) }
  scenario "click login link" do
    visit root_path
    click_link "Login"
    expect(current_path).to eq login_path
    expect(page).to have_content "Login"
  end
  context "as a admin" do
    scenario "enter a valid admin user" do
      visit login_path
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"

      expect(current_path).to eq admin_root_path
      expect(page).to have_content "Welcome, #{admin_user.email}"
    end
    scenario "enter a invalid admin user" do
      visit login_path
      fill_in "Email", with: "invalid@invalid.com"
      fill_in "Password", with: "invalid"
      click_button "Log In"

      expect(current_path).to_not eq admin_root_path
      expect(page).to_not have_content "Welcome"
    end

  end
end