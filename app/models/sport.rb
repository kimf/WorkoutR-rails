# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ApplicationRecord
  has_many :planned_workouts, class_name: 'Workout', foreign_key: 'planned_sport_id'
  has_many :actual_workouts, class_name: 'Workout', foreign_key: 'actual_sport_id'
  has_many :races
end
