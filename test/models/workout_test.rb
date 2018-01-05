# == Schema Information
#
# Table name: workouts
#
#  id                      :integer          not null, primary key
#  planned_date            :date
#  planned_sport_id        :integer
#  planned_km              :float
#  planned_minutes         :float
#  planned_workout_type_id :integer
#  description             :text
#  actual_date             :date
#  actual_sport_id         :integer
#  actual_km               :float
#  actual_minutes          :float
#  actual_workout_type_id  :integer
#  notes                   :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
