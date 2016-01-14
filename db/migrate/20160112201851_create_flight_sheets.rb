class CreateFlightSheets < ActiveRecord::Migration
  def change
    create_table :flight_sheets do |t|
      t.time :departure_time, :default => 0
      t.time :arrival_time, :default => 0
      t.references :helicopter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
