require 'garmin_tcx'

class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.assign_attributes(workout_params)

    xml_contents = File.read(workout_params[:training_file].path)
    tcx = GarminTcx.new(xml_contents)

    @workout.actual_minutes = tcx.total_time / 60
    @workout.actual_km = tcx.total_distance / 1000

    @workout.save
    @workout.training_file.attach(workout_params[:training_file])

    flash[:notice] = 'SPARADE OCH SÅDÄR'
    redirect_to :workout
  end

  private

  def workout_params
    params.require(:workout).permit(
      :notes,
      :training_file,
      :actual_date,
      :actual_sport_id,
      :actual_workout_type_id
    )
  end
end