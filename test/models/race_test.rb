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

require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
