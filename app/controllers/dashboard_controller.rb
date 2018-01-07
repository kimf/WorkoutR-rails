class DashboardController < ApplicationController

  def index
    today = Date.today
    @start = Date.parse('2017-04-27')
    date_range = @start..today

    @measurements = Measurement.all.to_a
    @consistency = Workout.group_by_week(:planned_date, format: '%V', range: date_range).count
    @consistency_distance = Workout.group_by_month(:planned_date, format: '%b', range: date_range).sum(:planned_km)

    last_date = today.end_of_month + 6.months
    @num_weeks = @start.step(last_date, 7).count
    @workouts = Workout.includes(:planned_sport, :planned_workout_type).where(planned_date: @start..last_date).all
  end
end
