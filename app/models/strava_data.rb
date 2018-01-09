# == Schema Information
#
# Table name: strava_data
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  strava_id   :integer
#  data        :jsonb
#  laps        :jsonb
#  zones       :jsonb
#  streams     :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StravaData < ApplicationRecord
  belongs_to :activity

  def self.get_sport_name(strava_type)
    case strava_type
    when "Ride", "EBikeRide", "VirtualRide"
      "Cycling"
    when "Run"
      "Running"
    when "Swim"
      "Swimming"
    when "NordicSki"
      "XCSkiing"
    when "Crossfit", "WeightTraining", "Workout"
      "Strength"
    when "RollerSki"
      "Roller Skiing"
    when "Yoga"
      "Flexibility"
    else
      raise "Unsupported Sport"
    end
  end

  def self.ignored_sports
    %w(
      Hike
      Walk
      AlpineSki
      BackcountrySki
      Canoeing
      Elliptical
      IceSkate
      InlineSkate
      Kayaking
      Kitesurf
      RockClimbing
      Rowing
      Snowboard
      Snowshoe
      StairStepper
      StandUpPaddling
      Surfing
      Windsurf
    )
  end
end