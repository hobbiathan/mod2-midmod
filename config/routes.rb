Rails.application.routes.draw do
  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'
  get '/movies/:id/new', to: 'movies#new'

  post '/movies/:id/new', to: 'movies#create'
end
