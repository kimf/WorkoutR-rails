require 'json'

[
  "Running",
  "Swimming",
  "XCSkiing",
  "Cycling",
  "Strength",
  "Flexibility",
  "Roller Skiing"
].each do |name|
  Sport.create(name: name)
end

# WorkoutTypes
%w(Easy LSD Interval Tempo Fartlek Test Technique Medium Hard Hills Race).each do |workout_type|
  WorkoutType.create(name: workout_type)
end


# TODO
# Ride
# Run
# Swim
# Hike
# Walk
# AlpineSki
# BackcountrySki
# Canoeing
# Crossfit
# EBikeRide
# Elliptical
# IceSkate
# InlineSkate
# Kayaking
# Kitesurf
# NordicSki
# RockClimbing
# RollerSki
# Rowing
# Snowboard
# Snowshoe
# StairStepper
# StandUpPaddling
# Surfing
# VirtualRide
# WeightTraining
# Windsurf
# Workout
# Yoga