class AddFlightTimeToFlightSheets < ActiveRecord::Migration
  def change
    add_column :flight_sheets, :flight_time, :time
  end
end
