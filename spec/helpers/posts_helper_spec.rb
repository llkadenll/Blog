require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostHelper. For example:
#
# describe PostHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  let(:user) { create(:user) }

  describe "#post_created_at" do
    let(:post) { create(:post, user: user, created_at: "Mon, 15 Aug 2022 20:50:51.394605000 UTC +00:00".to_date) }
    it "should return date in a proper form" do
      expect(post_created_at(post)).to eq("15-08-22")
    end
  end

  describe "#post_category" do
    context "when post has no category" do
      let(:post) { create(:post, user: user) }
      it "should return nil" do
        expect(post_category(post)).to eq(nil)
      end
    end

    context "when post has sport category" do
      let(:category) { create(:category, name: 'sport', icon: "fa-futbol-o", color: 'danger') }
      let(:post) { create(:post, user: user, category: category) }
      it "should return a proper span" do
        expect(post_category(post)).to eq("<span class=\"text-danger\"><i class=\"fa fa-futbol-o\"></i> Sport</span>")
      end
    end
  end

  describe "#post_public" do
    context "when post is not public" do
      let(:post) { create(:post, user: user) }
      it "should return Private" do
        expect(post_public(post)).to eq('Private')
      end
    end

    context "when post is public" do
      let(:post) { create(:post, user: user, public: true) }
      it "should return Public" do
        expect(post_public(post)).to eq('Public')
      end
    end
  end
end
