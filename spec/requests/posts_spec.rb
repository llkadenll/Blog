require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:blog_post) { create(:post, user: user) }

  let(:valid_params) { { post: { user: user, title: 'title', body: '12345678910' } } }
  let(:invalid_params) { { post: { user: '', title: '', body: '' } } }

  describe "GET /index" do
    context "when user not signed in" do
      it "redirects to public posts" do
        get posts_path
        expect(response).to redirect_to(public_posts_path)
      end
    end

    context "when user signed in" do
      before { sign_in user }
      it "returns http success" do
        get posts_path
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context "when user not signed in and post not public" do
      it "raises an error" do
        expect{ get post_url(blog_post) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when user not signed in and post public" do
      before { blog_post.update(public: true) }
      it "returns http success" do
        get post_url(blog_post)
        expect(response).to be_successful
      end
    end

    context "when user signed in" do
      before { sign_in user }
      it 'returns http success' do
        get post_url(blog_post)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /new" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get new_post_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user signed in" do
      before { sign_in user }
      it "returns http success" do
        get new_post_url
        expect(response).to be_successful
      end
    end
  end

  describe "Get /edit" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get edit_post_url(blog_post)
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "when user signed in" do
      before { sign_in user }
      it "returns http success" do
        get edit_post_url(blog_post)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    before { sign_in user }

    context "with valid parameters" do
      it "increments number of posts by 1" do
        expect{post posts_url, params: valid_params}.to change(Post, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "returns 422 unprocessable entity" do
        post posts_url, params: invalid_params
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH #update" do
    before { sign_in user }

    context "with valid parameters" do
      it "redirects to post url" do
        patch post_url(blog_post), params: valid_params
        expect(response).to redirect_to(post_url(blog_post))
      end
    end

    context "with invalid parameters" do
      it "returns 422 unprocessable entity" do
        patch post_url(blog_post), params: invalid_params
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    before { sign_in user }

    it "redirects to posts url" do
      delete post_url(blog_post)
      expect(response).to redirect_to(posts_url)
    end
  end

end
