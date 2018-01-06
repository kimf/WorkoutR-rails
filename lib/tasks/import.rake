require 'json'
namespace :import do
  desc "Import Measurements from json"
  task measurements: :environment do
    Dir["lib/tasks/old_json_files/*.json"].each do |file|
      items = JSON.parse(File.read(file))["values"]
      measurements = items.select{|item| item["_typeName"] == "Measurement"}

      measurements.each do |item|
        Measurement.create(
          weight: item["weight"].to_f,
          waist: item["waist"].to_f,
          hips: item["hips"].to_f,
          thigh: item["thigh"].to_f,
          measured_at: item["date"],
        )
      end
    end
  end

  desc "Import Races from json"
  task races: :environment do
    Dir["lib/tasks/old_json_files/*.json"].each do |file|
      items = JSON.parse(File.read(file))["values"]
      races = items.select{|item| item["_typeName"] == "Workout" && item["plannedType"] == "Race"}

      races.each do |item|
        Race.create(
          sport: Sport.where(name: item["plannedSport"]).first,
          goal_time:  item["plannedMinutes"].to_f,
          actual_time: item["actualMinutes"].to_f,
          distance: item["plannedKm"].to_f,
          date: item["plannedDate"],
          name: item["plannedInformation"],
          notes: item["notes"]
        )
      end
    end
  end

  desc "Import Workouts from json"
  task workouts: :environment do
    Dir["lib/tasks/old_json_files/*.json"].each do |file|
      items = JSON.parse(File.read(file))["values"]
      workouts = items.select{|item| item["_typeName"] == "Workout" && item["plannedType"] != "Race"}

      workouts.each do |item|
        Workout.create!(
          planned_date: item["plannedDate"],
          planned_sport: Sport.where(name: item["plannedSport"].to_s.squish).first,
          planned_km: item["plannedKm"].to_f,
          planned_minutes: item["plannedMinutes"].to_f,
          planned_workout_type: WorkoutType.where(name: item["plannedType"].to_s.squish).first || nil,
          description: item["plannedInformation"],
        )
      end
    end
  end
end
