require "administrate/base_dashboard"

class WorkoutDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    planned_sport: Field::BelongsTo.with_options(class_name: "Sport"),
    actual_sport: Field::BelongsTo.with_options(class_name: "Sport"),
    planned_workout_type: Field::BelongsTo.with_options(class_name: "WorkoutType"),
    actual_workout_type: Field::BelongsTo.with_options(class_name: "WorkoutType"),
    id: Field::Number,
    planned_date: Field::DateTime,
    planned_sport_id: Field::Number,
    planned_km: Field::Number.with_options(decimals: 2),
    planned_minutes: Field::Number.with_options(decimals: 2),
    planned_workout_type_id: Field::Number,
    description: Field::Text,
    actual_date: Field::DateTime,
    actual_sport_id: Field::Number,
    actual_km: Field::Number.with_options(decimals: 2),
    actual_minutes: Field::Number.with_options(decimals: 2),
    actual_workout_type_id: Field::Number,
    notes: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :planned_sport,
    :actual_sport,
    :planned_workout_type,
    :actual_workout_type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :planned_sport,
    :actual_sport,
    :planned_workout_type,
    :actual_workout_type,
    :id,
    :planned_date,
    :planned_sport_id,
    :planned_km,
    :planned_minutes,
    :planned_workout_type_id,
    :description,
    :actual_date,
    :actual_sport_id,
    :actual_km,
    :actual_minutes,
    :actual_workout_type_id,
    :notes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :planned_sport,
    :actual_sport,
    :planned_workout_type,
    :actual_workout_type,
    :planned_date,
    :planned_sport_id,
    :planned_km,
    :planned_minutes,
    :planned_workout_type_id,
    :description,
    :actual_date,
    :actual_sport_id,
    :actual_km,
    :actual_minutes,
    :actual_workout_type_id,
    :notes,
  ].freeze

  # Overwrite this method to customize how workouts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(workout)
  #   "Workout ##{workout.id}"
  # end
end
