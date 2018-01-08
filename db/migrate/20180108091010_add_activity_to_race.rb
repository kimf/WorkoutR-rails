class AddActivityToRace < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :activities, :race, index: true
  end
end
