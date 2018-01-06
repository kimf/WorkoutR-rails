class ApplicationController < ActionController::Base
  helper_method :sports
  helper_method :workout_types

  def sports
    Rails.cache.fetch("sports", expires_in: 100.days) do
      Sport.all
    end
  end

  def workout_types
    Rails.cache.fetch("workout_types", expires_in: 100.days) do
      WorkoutType.all
    end
  end
end
