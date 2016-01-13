class FlightSheet < ActiveRecord::Base
  belongs_to :helicopter
  before_save :write_flight_time
  after_save :update_scheduled_inspections

  private
  def update_scheduled_inspections
    ScheduledInspection.create(:flight_hours=>FlightSheet.flight_hours, :helicopter_id  => FlightSheet.all.last.helicopter_id)
  end

  def write_flight_time
    self.flight_time = (arrival_time-departure_time) / 1.hour
  end

  def self.flight_hours
    FlightSheet.sum(:flight_time)
  end
end
