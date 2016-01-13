class CreateHelicopters < ActiveRecord::Migration
  def change
    create_table :helicopters do |t|
      t.string :plate_number

      t.timestamps null: false
    end
  end
end
