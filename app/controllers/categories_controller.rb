class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id], user: current_user).or(Post.where(category_id: params[:id], public: true)).order(updated_at: :desc)
    # Post.where(user: current_user).or(Post.where(public: true))).order(updated_at: :desc)
  end
end
