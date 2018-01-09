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
#  imported_at :datetime
#

class Activity < ApplicationRecord
  belongs_to :workout
  belongs_to :sport
  has_one :strava_data, dependent: :destroy
  has_one_attached :training_file

  def self.latest_import_date
    order(imported_at: :desc).limit(1).first&.imported_at
  end
end
