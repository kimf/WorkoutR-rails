# == Schema Information
#
# Table name: measurements
#
#  id          :integer          not null, primary key
#  weight      :float
#  waist       :float
#  hips        :float
#  thigh       :float
#  measured_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Measurement < ApplicationRecord
    default_scope { order(measured_at: :asc) }
end
