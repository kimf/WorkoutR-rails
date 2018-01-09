class RemoveWorkoutTypeFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :workout_type_id
  end
end
