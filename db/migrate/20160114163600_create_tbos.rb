class CreateTbos < ActiveRecord::Migration
  def change
    create_table :tbos do |t|
      t.integer :initial_value
      t.integer :end_value
      t.string :unit
      t.references :component, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
