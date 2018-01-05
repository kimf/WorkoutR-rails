class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.float :weight
      t.float :waist
      t.float :hips
      t.float :thigh
      t.datetime :measured_at

      t.timestamps
    end
  end
end
