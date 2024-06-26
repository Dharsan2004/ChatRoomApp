Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete "logout" ,to: "sessions#destroy"

  post "/message" => "messages#create"

  mount ActionCable.server , at: '/cable'

end
