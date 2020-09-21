Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index]
  resources :passengers, only: :index
  resources :airlines, only: :show

  get '/flights/:id/update', to: 'flights#update', as: :flight_update
end
