Rails.application.routes.draw do
  namespace :admin do
    resources :measurements
    resources :sports
    resources :workouts
    resources :workout_types
    resources :activities

    root to: "workouts#index"
  end

  resources :workouts, only: [:show]
  resources :activities, only: [:create, :update]

  root to: "dashboard#index"
end
