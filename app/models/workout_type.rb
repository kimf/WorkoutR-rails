# == Schema Information
#
# Table name: workout_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkoutType < ApplicationRecord
  has_many :planned_workouts, class_name: 'Workout', foreign_key: 'planned_workout_type_id'
  has_many :actual_workouts, class_name: 'Workout', foreign_key: 'actual_workout_type_id'
end
