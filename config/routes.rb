Rails.application.routes.draw do
  namespace :admin do
      resources :measurements
      resources :races
      resources :sports
      resources :workouts
      resources :workout_types

      root to: "measurements#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
end
