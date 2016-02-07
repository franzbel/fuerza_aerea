class FlightSheet < ActiveRecord::Base
  belongs_to :helicopter
  before_save :set_flight_time
  after_save :set_elapsed_time, :update_scheduled_inspections

  private
  #-------------------------------------------------------------------------------------------#
  # Actualizamos el atributo elapsed_time de la tabla components. Este valor representa el    #
  # tiempo transcurrido desde el ultimo overhaul                                              #
  #-------------------------------------------------------------------------------------------#
  def set_elapsed_time
     helicopter = Helicopter.find(self.helicopter_id)
     helicopter.systems.each do |system|
       system.components.each do |component|
         component.elapsed_time = self.flight_time + component.elapsed_time
         component.save
       end
     end
  end
  #-------------------------------------------------------------------------------------------#

  #-------------------------------------------------------------------------------------------#
  # Establecemos el valor del atributo flight_time de la tabla flight_sheets. Este atribuo    #
  # representa el tiempo que duro un determinado vuelo                                        #
  #-------------------------------------------------------------------------------------------#
  def set_flight_time
    self.flight_time = (arrival_time-departure_time) / 1.hour
  end
  #-------------------------------------------------------------------------------------------#




  def self.flight_hours
    FlightSheet.sum(:flight_time)
  end
  def update_scheduled_inspections
    ScheduledInspection.create(:flight_hours=>FlightSheet.flight_hours, :helicopter_id  => FlightSheet.all.last.helicopter_id)
  end

end
