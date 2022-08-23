require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:category) { create(:category) }

  describe "GET /index" do
    it "redirects to public posts" do
      get categories_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it "returns http success" do
      get category_path(category)
      expect(response).to be_successful
    end
  end

end
