
class DashboardController < ApplicationController

  def index
    today = Date.today
    date_range = Date.parse('2017-04-27')..today

    @measurements = Measurement.all.to_a
    @consistency = Workout.completed.group_by_week(:actual_date, format: '%V', range: date_range).count

    @consistency_distance = Workout.group_by_month(:actual_date, format: '%b', range: date_range).sum(:planned_km)

    last_date = today.end_of_month + 2.months
    @start = today.beginning_of_week - 3.weeks
    @num_weeks = @start.step(last_date, 7).count
    workouts = Workout.includes(:planned_sport, :planned_workout_type).where(planned_date: @start..last_date).all.to_a
    races = Race.includes(:sport).where(date: @start..last_date).all.to_a.map do |race|
      Workout.new(
        is_race: true,
        planned_date: race.date,
        planned_sport: race.sport,
        planned_km: race.distance,
        planned_minutes: race.goal_time,
        actual_date: race.completed? ? race.date : nil,
        description: race.name
      )
    end

    @events = workouts + races
  end
end
