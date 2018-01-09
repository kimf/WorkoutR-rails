class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
    @activity = @workout.activity || Activity.new(
      workout: @workout,
      date: @workout.date,
      sport: @workout.sport
    )
  end
end