class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy]

  def index
    unless user_signed_in?
      redirect_to public_posts_path
      return
    end

    @pagy, @posts = pagy(current_user.posts.order(updated_at: :desc))
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Post was successfully destroyed." }
    end
  end

  def public_posts
    @pagy, @posts = pagy(Post.where(public: true).order(updated_at: :desc))
  end

  def preview # for async form validation
    if Post.exists?(params[:post_id])
      @preview_post = Post.find(params[:post_id])
      @preview_post.title = params[:post][:title]
      @preview_post.body = params[:post][:body]
      @preview_post.public = params[:post][:public]
      @preview_post.category_id = params[:post][:category_id]
    else
      @preview_post = Post.new(post_params)
      @preview_post.user = current_user
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def set_post
      @post = user_signed_in? ? current_user.posts.find(params[:id]) : Post.where(public: true).find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def post_params
      params.require(:post).permit(:title, :body, :public, :category_id)
    end
end
