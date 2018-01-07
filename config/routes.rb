Rails.application.routes.draw do
  namespace :admin do
    resources :measurements
    resources :races
    resources :sports
    resources :workouts
    resources :workout_types

    root to: "measurements#index"
  end

  resources :workouts

  root to: "dashboard#index"
end
