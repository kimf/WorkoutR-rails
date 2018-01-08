class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.date :date
      t.belongs_to :workout, foreign_key: true
      t.belongs_to :sport, foreign_key: true
      t.float :km
      t.float :minutes
      t.belongs_to :workout_type, foreign_key: true
      t.text :description

      t.timestamps
    end

    remove_column :workouts, :actual_date
    remove_column :workouts, :actual_sport_id
    remove_column :workouts, :actual_km
    remove_column :workouts, :actual_minutes
    remove_column :workouts, :actual_workout_type_id
    remove_column :workouts, :notes

    rename_column :workouts, :planned_date, :date
    rename_column :workouts, :planned_km, :km
    rename_column :workouts, :planned_minutes, :minutes
    rename_column :workouts, :planned_workout_type_id, :workout_type_id
    rename_column :workouts, :planned_sport_id, :sport_id

  end
end
