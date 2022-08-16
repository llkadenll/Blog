Rails.application.routes.draw do
  root "posts#index"

  get "/public_posts/", to: "posts#public_posts"
  devise_for :users
  resources :posts do
    collection do # for async form validation
      post :preview
    end
  end
  resources :categories, only: [ :index, :show ]
end
