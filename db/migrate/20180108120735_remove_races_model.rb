class RemoveRacesModel < ActiveRecord::Migration[5.2]
  def change

    wo = WorkoutType.where(name: 'Race').first

    Race.all.each do |race|
      Workout.create(
        date: race.date,
        sport_id: race.sport_id,
        km: race.distance,
        minutes: race.goal_time,
        workout_type: wo,
        description: race.name
      )
    end

    drop_table :races
  end
end
