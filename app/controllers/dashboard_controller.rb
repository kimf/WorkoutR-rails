class DashboardController < ApplicationController

  def index
    today = Date.today
    @start = today.beginning_of_month - 9.months
    @stop = today.end_of_month + 6.months
    @measurements = Measurement.all
    # @workouts = Workout.all
    date_range = Date.parse('2017-04-27')..Date.today
    @consistency = Workout.group_by_week(:planned_date, format: '%V', range: date_range).count
    @consistency_distance = Workout.group_by_month(:planned_date, format: '%b', range: date_range).sum(:planned_km)
  end
end
