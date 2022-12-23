Rails.application.routes.draw do
  namespace :admin do
    resources :measurements
    resources :sports
    resources :workouts
    resources :workout_types
    resources :activities
    resources :strava_datas

    root to: "workouts#index"
  end

  resources :workouts, only: [:show]
  # resources :activities, only: [:create, :update]

  get '/import', to: "import#index"
  post '/import', to: "import#transform"

  root to: "dashboard#index"
end
