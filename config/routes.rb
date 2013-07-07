Fandangr::Application.routes.draw do
  resources :movies, only: [:index, :show] do
    resources :showtimes, only: :show do
      post :purchase
    end
  end

  root to: "movies#index"
end

