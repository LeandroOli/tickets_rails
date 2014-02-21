require 'spec_helper'

feature "Admin Static Pages" do
  context "as a guest" do
    scenario "enter admin root page" do
      visit admin_root_path
      expect(page).to have_content("Please log in first")
    end
  end
end