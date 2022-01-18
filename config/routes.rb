Rails.application.routes.draw do
  # get '/users/:user_id/posts', to: 'posts#index'
  # get '/users/:user_id/posts/:id', to: 'posts#show'

  resources :users, only: %i[index show] do
    resources :posts, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
