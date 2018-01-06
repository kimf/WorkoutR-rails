class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.references :sport, foreign_key: true
      t.float :goal_time
      t.float :actual_time
      t.float :distance
      t.date :date
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
