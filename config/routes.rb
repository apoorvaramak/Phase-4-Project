Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/pets', to: "pets#index"

  # get '/shelters', to: "shelters#index"

  # get '/pet/:id', to: "pets#show"

  # get '/shelter/:id', to: "shelters#show"
  get resources :shelters, only: [:index, :show]
  get resources :pets

  post '/login', to: "sessions#create"

  post '/signup', to: "users#create"

  delete '/logout', to: "sessions#destroy"

end
