
class DashboardController < ApplicationController

  def index
    @measurements = Measurement.all.to_a

    today = Date.today
    # first has to be monday for my super naive "count only days worked out not workouts"
    date_range = Date.parse('2017-04-24')..today
    days = Activity.group_by_day(:date, format: '%Y-%m-%d', range: date_range).count
    weeks = days.each_slice(7).to_a
    @consistency = weeks.map do |week|
      [
        Date.parse(week[0][0]).strftime('%V'),
        week.select{|d| d[1] > 0 }.size
      ]
    end
    @consistency_distance = Activity.group_by_month(:date, format: '%b', range: date_range).sum(:km)

    last_date = today.end_of_month + 2.months
    @start = today.beginning_of_week - 3.weeks
    @num_weeks = @start.step(last_date, 7).count
    @events = Workout.includes(:sport, :workout_type, :activity).where(date: @start..last_date).all.to_a
  end
end
