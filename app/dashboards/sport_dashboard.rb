require "administrate/base_dashboard"

class SportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    planned_workouts: Field::HasMany.with_options(class_name: "Workout"),
    actual_workouts: Field::HasMany.with_options(class_name: "Workout"),
    races: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :planned_workouts,
    :actual_workouts,
    :races,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :planned_workouts,
    :actual_workouts,
    :races,
    :id,
    :name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :planned_workouts,
    :actual_workouts,
    :races,
    :name,
  ].freeze

  # Overwrite this method to customize how sports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sport)
  #   "Sport ##{sport.id}"
  # end
end
