require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "creating an account" do
    before { visit new_user_registration_path }

    it "should be successful" do

      fill_in "Email", with: "newaccount@gmail.com"
      fill_in "Password (6 characters minimum)", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"

      expect(page).to have_text("Welcome! You have signed up successfully.")
    end
  end

  describe "logging into an existing account" do
    let(:user) { create(:user) }
    before { visit new_user_session_path }

    it "should be successful" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      expect(page).to have_text("Signed in successfully.")
    end
  end
end
