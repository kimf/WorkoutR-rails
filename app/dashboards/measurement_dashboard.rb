require "administrate/base_dashboard"

class MeasurementDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    weight: Field::Number.with_options(decimals: 1, suffix: ' kg'),
    waist: Field::Number.with_options(decimals: 1, suffix: ' cm'),
    hips: Field::Number.with_options(decimals: 1, suffix: ' cm'),
    thigh: Field::Number.with_options(decimals: 1, suffix: ' cm'),
    measured_at: Field::DateTime,
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
    :measured_at,
    :weight,
    :waist,
    :hips,
    :thigh
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :weight,
    :waist,
    :hips,
    :thigh,
    :measured_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :weight,
    :waist,
    :hips,
    :thigh,
    :measured_at,
  ].freeze

  # Overwrite this method to customize how measurements are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(measurement)
    "Mätning ##{measurement.id} - #{measurement.measured_at.to_s(:day_and_month)}"
  end
end
