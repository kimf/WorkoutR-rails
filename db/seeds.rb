require 'json'

# Sports
["Running", "Swimming", "XCSkiing", "Cycling", "Strength", "Flexibility", "Roller Skiing").each do |name|
  Sport.create(name: name)
end

# WorkoutTypes
%w(Easy LSD Interval Tempo Fartlek Test Technique Medium Hard Hills Race).each do |workout_type|
  WorkoutType.create(name: workout_type)
end

# WorkoutTemplate