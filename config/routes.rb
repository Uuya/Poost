Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: :show
  root 'top#index'
  resources :posts, only: [:index, :new, :create, :destroy]
  get 'posts/fav/:id' => 'posts#fav', as: "fav_posts"
end
