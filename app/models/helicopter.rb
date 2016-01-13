class Helicopter < ActiveRecord::Base
  has_many :flight_sheets
  has_one :scheduled_inspection
end
