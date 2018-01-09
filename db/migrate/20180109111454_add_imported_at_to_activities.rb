class AddImportedAtToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :imported_at, :datetime

    create_table :strava_data do |t|
      t.belongs_to :activity, foreign_key: true
      t.integer :strava_id
      t.jsonb :data, default: {}
      t.jsonb :laps, default: {}
      t.jsonb :zones, default: {}
      t.jsonb :streams, default: {}

      t.timestamps
    end
  end
end
