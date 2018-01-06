class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.date :planned_date
      t.references :planned_sport
      t.float :planned_km
      t.float :planned_minutes
      t.references :planned_workout_type
      t.text :description
      t.date :actual_date
      t.references :actual_sport
      t.float :actual_km
      t.float :actual_minutes
      t.references :actual_workout_type
      t.text :notes

      t.timestamps
    end
  end
end
