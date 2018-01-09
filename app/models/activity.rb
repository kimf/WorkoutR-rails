# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  date        :date
#  workout_id  :integer
#  sport_id    :integer
#  km          :float
#  minutes     :float
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Activity < ApplicationRecord
  belongs_to :workout
  belongs_to :sport

  has_one_attached :training_file
end
