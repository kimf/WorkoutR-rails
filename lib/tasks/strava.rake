require 'strava/api/v3'

# @client.totals_and_stats(athelete_id)
# @client.list_activity_laps
# @client.retrieve_activity_streams(:strava_id)

namespace :strava do
  desc "Fetch Activities from strava and add them + data to workouts"
  task fetch: :environment do
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    # athelete_id = Rails.application.credentials.strava[:athlete_id]
    @client = Strava::Api::V3::Client.new(:access_token => Rails.application.credentials.strava[:access_token])

    last_import = Activity.latest_import_date
    after = last_import || Date.parse('2017-04-01').to_time
    #puts after

    summaries = {
      date: Date.today,
      updated: [],
      added: [],
      skipped: [],
      saved_only_strava_data: []
    }


    activities = @client.list_athlete_activities(after: after.to_i, per_page: 200)
    # activities = JSON.parse(File.read("lib/tasks/tmp_strava_data/activities.json"))
    # puts activities.size

    activities.each do |strava|
      if StravaData.ignored_sports.include?(strava["type"])
        summaries[:skipped] << { reason: "Ignored type: #{strava["type"]}", id: strava["id"] }
      else
        imported = StravaData.where(strava_id: strava["id"]).limit(1).first

        activity_data = {
          imported_at: Time.now,
          km: strava["distance"].to_f / 1000,
          minutes: strava["moving_time"] / 60,
          description: strava["description"]
        }


        if imported
          imported.update_attribute(:data, strava.to_json)
          imported.activity.update_attributes(activity_data)
          summaries[:updated] << { strava_id: strava["id"], activity_id: imported.activity.id }
        else
          sport = Sport.where(name: StravaData.get_sport_name(strava["type"])).first

          if sport.nil?
            summaries.skipped << { reason: "Could not find Sport in DB", strava_id: strava["id"], strava_sport: strava["type"] }
            return
          end

          date = strava["start_date_local"]
          workout = Workout.where(sport: sport, date: date).first
          strava_data = StravaData.create!(strava_id: strava["id"], data: strava.to_json)

          activity_data = activity_data.merge({
            date: date,
            workout: workout,
            sport: sport,
            strava_data: strava_data
          })

          if workout.nil?
            summaries[:saved_only_strava_data] << { strava_id: strava["id"], strava_data_id: strava_data.id }
          else
            activity = Activity.create!(activity_data)
            summaries[:added] << { strava_id: strava["id"], activity_id: activity.id, workout_id: workout.id }
          end
        end
      end
    end

    File.open("import_result_summaries.json","w") do |f|
      f.write(summaries.to_json)
    end
  end
end
