# == Schema Information
#
# Table name: activities
#
#  id              :integer          not null, primary key
#  date            :date
#  workout_id      :integer
#  sport_id        :integer
#  km              :float
#  minutes         :float
#  workout_type_id :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  race_id         :integer
#

class Activity < ApplicationRecord
  belongs_to :workout
  belongs_to :sport
  belongs_to :workout_type

  has_one_attached :training_file
end
