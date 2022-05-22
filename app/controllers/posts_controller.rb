class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if !user_signed_in?
      redirect_to "/public_posts/"
    else
      @posts = Post.all
    end
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)

    @post.author_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
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

  def public_posts
    @posts = Post.all
  end

  def search
    @posts = Post.all
    @query = params[:query]
  end

  def preview # for async form validation
    @preview_post = Post.new(post_params)
    # redirect_to request.url, notice: "#{@preview_post.valid?} #{@preview_post.errors.full_messages}"
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :public, :category_id)
    end
end
