class FlightSheet < ActiveRecord::Base
  belongs_to :helicopter
  before_save :write_flight_time
  after_save :update_scheduled_inspections, :update_components

  private
  #--------------- ACTUALIZAMOS LA COLUMNA elapsedTime DE components---------------#
  def update_components
     helicopter = Helicopter.find(self.helicopter_id)
     helicopter.systems.each do |system|
       system.components.each do |component|
         component.elapsed_time = self.flight_time + component.elapsed_time
         component.save
       end
     end
  end

  #------------- FIN ACTUALIZAMOS LA COLUMNA elapsedTime DE components-------------#

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
