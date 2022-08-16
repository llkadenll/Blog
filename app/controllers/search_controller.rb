class SearchController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result.and(Post.where(user: current_user).or(Post.where(public: true))).order(updated_at: :desc)
  end
end
