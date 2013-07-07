Fandangr::Application.routes.draw do
  get "showtimes/show"

  resources :movies, only: [:index, :show]
  root to: "movies#index"
end 

