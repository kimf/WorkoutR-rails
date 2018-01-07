class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.training_files.attach(workout_params[:training_files])
    @workout.update_attribute(:notes, workout_params[:notes])
    flash[:notice] = 'SPARADE OCH SÅDÄR'
    redirect_to :workout
  end

  private

  def workout_params
    params.require(:workout).permit(:notes, :training_files)
  end
end
