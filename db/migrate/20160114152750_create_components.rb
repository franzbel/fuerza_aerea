class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :state, :default => 'new'
      t.time :elapsed_time, :default => 0
      t.references :system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
