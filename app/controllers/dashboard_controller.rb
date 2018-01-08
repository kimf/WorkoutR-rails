
class DashboardController < ApplicationController

  def index
    today = Date.today
    date_range = Date.parse('2017-04-27')..today

    @measurements = Measurement.all.to_a
    @consistency = Activity.group_by_week(:date, format: '%V', range: date_range).count
    @consistency_distance = Activity.group_by_month(:date, format: '%b', range: date_range).sum(:km)

    last_date = today.end_of_month + 2.months
    @start = today.beginning_of_week - 3.weeks
    @num_weeks = @start.step(last_date, 7).count
    @events = Workout.includes(:sport, :workout_type, :activity).where(date: @start..last_date).all.to_a
  end
end
