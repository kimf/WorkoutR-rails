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

  desc "Import Workouts from json"
  task workouts: :environment do
  end
end
