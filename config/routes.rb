Rails.application.routes.draw do
  root "posts#index"

  get "/public_posts/", to: "posts#public_posts"
  get "/search", to: "posts#search"
  devise_for :users
  resources :posts
end
