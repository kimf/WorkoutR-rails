require "administrate/base_dashboard"

class RaceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sport: Field::BelongsTo,
    id: Field::Number,
    goal_time: Field::Number.with_options(decimals: 2),
    actual_time: Field::Number.with_options(decimals: 2),
    distance: Field::Number.with_options(decimals: 2),
    date: Field::DateTime,
    name: Field::String,
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
    :id,
    :date,
    :sport,
    :name,
    :goal_time,
    :actual_time,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :sport,
    :id,
    :goal_time,
    :actual_time,
    :distance,
    :date,
    :name,
    :notes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sport,
    :goal_time,
    :actual_time,
    :distance,
    :date,
    :name,
    :notes,
  ].freeze

  # Overwrite this method to customize how races are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(race)
    "Race ##{race.id} - #{race.name}"
  end
end
