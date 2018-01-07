# == Schema Information
#
# Table name: races
#
#  id          :integer          not null, primary key
#  sport_id    :integer
#  goal_time   :float
#  actual_time :float
#  distance    :float
#  date        :date
#  name        :string
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Race < ApplicationRecord
  belongs_to :sport

  default_scope { order(date: :desc) }

  def completed?
    !actual_time.nil?
  end
end
