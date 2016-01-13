class CreateScheduledInspections < ActiveRecord::Migration
  def change
    create_table :scheduled_inspections do |t|
      t.references :helicopter, index: true, foreign_key: true
      t.time :flight_hours, :default => 0
      t.boolean :supplementary_check_50, :default => false
      t.boolean :supplementary_check_100, :default => false
      t.boolean :intermediate_inspection, :default => false
      t.boolean :periodical_inspection, :default => false

      t.timestamps null: false
    end
  end
end
