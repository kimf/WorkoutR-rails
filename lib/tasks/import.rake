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

  desc "Import Workouts from google_sheets json"
  task workouts_again: :environment do
    Dir["lib/tasks/old_json_files/2018.json"].each do |file|
      weeks = JSON.parse(File.read(file))

      weeks.each do |week|
        date_parts = week["v"].split("-").map(&:to_i)
        week["days"].each do |day|
          planned_date = Date.commercial(date_parts[0], date_parts[1], day["day"].to_i)

          workouts = day["data"].split("+")
          workouts.each do |wo|
            parts = wo.split('|')
            sport = parts[0]
            min = parts[1].to_f
            km = parts[2].to_f
            type = parts[3]
            info = parts[4]

            Workout.create!(
              planned_date: planned_date,
              planned_sport: Sport.where(name: sport.to_s.squish).first,
              planned_km: km,
              planned_minutes: min,
              planned_workout_type: WorkoutType.where(name: type.to_s.squish).first || nil,
              description: info,
            )
          end
        end
      end
    end
  end
end
