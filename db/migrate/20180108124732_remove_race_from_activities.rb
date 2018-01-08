class RemoveRaceFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :race_id
  end
end
