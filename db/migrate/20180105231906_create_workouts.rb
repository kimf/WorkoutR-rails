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

    add_foreign_key :workouts, :sports, column: :planned_sport_id, primary_key: :id
    add_foreign_key :workouts, :sports, column: :actual_sport_id, primary_key: :id

    add_foreign_key :workouts, :sports, column: :planned_workout_type_id, primary_key: :id
    add_foreign_key :workouts, :sports, column: :actual_workout_type_id, primary_key: :id
  end
end
