class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :ata_100
      t.string :title
      t.references :helicopter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
