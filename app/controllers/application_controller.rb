class ApplicationController < ActionController::Base
  before_action :set_query
  include Pagy::Backend

  def set_query
    @query = Post.ransack(params[:q])
  end
end
