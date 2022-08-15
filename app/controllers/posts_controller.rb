class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_posts, only: %i[ index public_posts search ]
  before_action :set_categories, only: %i[ new edit ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if !user_signed_in?
      redirect_to "/public_posts/"
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  def search
    @query = params[:query].downcase
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

    def set_posts
      @posts = Post.all.order(updated_at: :desc)
    end

    def set_categories
      @categories = Category.all
    end

    def post_params
      params.require(:post).permit(:title, :body, :public, :category_id)
    end
end
