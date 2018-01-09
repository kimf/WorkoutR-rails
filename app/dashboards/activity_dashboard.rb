require "administrate/base_dashboard"

class ActivityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sport: Field::BelongsTo.with_options(class_name: "Sport"),
    workout: Field::BelongsTo.with_options(class_name: "Activity"),
    strava_data: Field::HasOne,
    id: Field::Number,
    date: Field::DateTime,
    sport_id: Field::Number,
    km: Field::Number.with_options(decimals: 2),
    minutes: Field::Number.with_options(decimals: 2),
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    imported_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :date,
    :sport,
    :strava_data,
    :minutes,
    :km,
    :description,
    :workout,
    :imported_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :date,
    :sport,
    :strava_data,
    :minutes,
    :km,
    :description,
    :created_at,
    :updated_at,
    :workout,
    :imported_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :id,
    :date,
    :sport,
    :strava_data,
    :minutes,
    :km,
    :description,
    :workout
  ].freeze

  # Overwrite this method to customize how workouts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(workout)
  #   "Workout ##{workout.id}"
  # end
end
