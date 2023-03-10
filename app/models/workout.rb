# == Schema Information
#
# Table name: workouts
#
#  id              :integer          not null, primary key
#  date            :date
#  sport_id        :integer
#  km              :float
#  minutes         :float
#  workout_type_id :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Workout < ApplicationRecord
  belongs_to :sport
  belongs_to :workout_type
  has_one :activity

  default_scope { order(date: :desc) }

  def is_race?
    workout_type&.name == "Race"
  end
end
