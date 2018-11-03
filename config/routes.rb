Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :programmers do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  get '/chatroom', to: 'rooms#show' #change route to add programmer id?
  # Serve websocket cable requests in-process
   mount ActionCable.server => '/cable'

  # resources :links do
  #   member do
  #     put "like", to: "links#upvote"
  #     put "dislike", to: "links#downvote"
  #   end
  # end

  root to: "programmers#index"
end
