require 'garmin_tcx'

class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new
    save_and_redirect
  end

  def update
    @activity = Activity.find(params[:id])
    save_and_redirect
  end

  private

  def save_and_redirect
    @activity.assign_attributes(activity_params)

    xml_contents = File.read(activity_params[:training_file].path)
    tcx = GarminTcx.new(xml_contents)

    @activity.minutes = tcx.total_time / 60
    @activity.km = tcx.total_distance / 1000

    @activity.save
    @activity.training_file.attach(activity_params[:training_file])

    flash[:notice] = 'SPARADE OCH SÅDÄR'
    redirect_to @activity.workout
  end

  def activity_params
    params.require(:activity).permit(
      :workout_id,
      :date,
      :sport_id,
      :description,
      :training_file
    )
  end
end