require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    driven_by(:selenium_chrome_headless)
    login_as(user)
  end

  describe "creating post" do
    before { visit new_post_path }

    context "with proper params" do
      it "should be succesful" do

        fill_in "Title", with: "New post"
        fill_in "Content", with: "Lorem ipsum dolor sit amet"
        click_button "Create Post"

        expect(page).to have_text("Post was successfully created.")
      end
    end

    context "with a blank title" do
      it "should not be successful" do

        fill_in "Content", with: "Lorem ipsum dolor sit amet"
        click_button "Create Post"

        expect(page).not_to have_text("Post was successfully created.")
      end
    end

    context "with too short body" do
      it "should not be successful" do

        fill_in "Title", with: "New post"
        fill_in "Content", with: "Lorem"
        click_button "Create Post"

        expect(page).not_to have_text("Post was successfully created.")
      end
    end
  end

  describe "updating post" do
    before { visit post_path(post) }

    it "should be successful" do

      click_link "Edit"
      fill_in "Content", with: "Edited body"
      click_button "Update Post"

      expect(page).to have_text("Post was successfully updated.")
    end
  end

  describe "deleting post" do
    before { visit post_path(post) }

    it "should be successful" do
      page.accept_confirm do
        click_link "Delete"
      end
      
      expect(page).to have_text("Post was successfully destroyed.")
    end
  end

end
