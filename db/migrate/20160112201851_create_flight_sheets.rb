class CreateFlightSheets < ActiveRecord::Migration
  def change
    create_table :flight_sheets do |t|
      t.time :departure_time
      t.time :arrival_time
      t.references :helicopter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
