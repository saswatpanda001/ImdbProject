Rails.application.routes.draw do
  get "landing/index"
  root 'landing#index'

  get "up" => "rails/health#show", as: :rails_health_check

    # Custom routes for actors
    get "actors" => "landing#actors", as: 'actors'  # Actors list route
    get "show_actors/:id" => "landing#show_actors", as: 'show_actor'  # Actor details route
    get 'directors', to: 'landing#directors'
    get 'directors/:id', to: 'landing#show_director', as: 'show_director'


  get "movies", to: "landing#movies", as: :movies
  get 'movies/:id', to: 'landing#show_movie', as: 'movie'





end