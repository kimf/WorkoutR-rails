require 'strava/api/v3'

namespace :strava do

  # https://www.strava.com/api/v3/athletes/4357291/stats

  desc "Fetch Activities from strava"
  task fetch: :environment do
    @client = Strava::Api::V3::Client.new(:access_token => Rails.application.credentials.strava_access_token)

    # if resource_state != 3 #skip and fetch in next run
  end
end
