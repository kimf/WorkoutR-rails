require 'json'

namespace :import do
  desc "Import Measurements from json"
  task tcx: :environment do
    Dir["lib/tasks/tcx_files/*.tcx"].each do |file|
      xml_contents = File.read(file)
      tcx = GarminTcx.new(xml_contents)

      sport = Sport.where(name: tcx.sport.to_s.squish).first
      workout = Workout.where(sport: sport, date: tcx.date).first

      Activity.create!(
        date: tcx.date,
        workout: workout,
        sport: sport,
        km: tcx.total_distance / 1000,
        minutes: tcx.total_time / 60,
        description: tcx.notes
      )

      # if workout.nil?
      #   puts "ERROR...."
      #   puts tcx.date
      #   puts tcx.sport
      #   puts tcx.total_time
      #   puts tcx.total_distance

      #   puts file
      #   puts "CHECK THIS FILE PLEASE"
      #   puts "########################################################"
      # end

      # sport = Sport.where(name: sport.to_s.squish).first
    end
  end
end
