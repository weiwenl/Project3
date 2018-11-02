Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :programmers do
    resources :posts do
      resources :comments
    end
  end

  root to: "programmers#index"
end
