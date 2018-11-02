Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :programmers do
    resources :posts, :comments
  end

  root to: "programmers#index"
end
