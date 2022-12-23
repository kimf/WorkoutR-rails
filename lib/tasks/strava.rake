require 'strava_fetcher'

namespace :strava do
  desc "Fetch Activities from strava and add them + data to workouts"
  task fetch: :environment do
    StravaFetcher.run
  end
end
