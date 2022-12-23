require 'strava_fetcher'

class ImportController < ApplicationController
  http_basic_authenticate_with(
    name: Rails.application.credentials.admin[:user],
    password: Rails.application.credentials.admin[:password],
  )

  def index
    #StravaFetcher.run

    @wotypes = WorkoutType.all
    @unmatched = StravaData.where(activity: nil).all
  end

  def transform
    sd = StravaData.find(params[:id])

    data = JSON.parse(sd.data)

    sport = Sport.where(name: StravaData.get_sport_name(data["type"])).first
    date = data["start_date"]

    km = data["distance"].to_f / 1000
    minutes = data["moving_time"] / 60

    workout = Workout.create(
      date: date,
      sport: sport,
      km: km,
      minutes: minutes,
      workout_type_id: transform_params[:wo_type_id],
    )

    activity = Activity.create!(
      imported_at: Time.now,
      km: km,
      minutes: minutes,
      description: data["description"],
      date: date,
      workout: workout,
      sport: sport,
      strava_data: sd,
    )
  end

  private

  def transform_params
    params.permit(:wo_type_id)
  end
end
