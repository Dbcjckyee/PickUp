class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :event_name
      t.text :description
      t.string :sport, { null: false }
      t.time :start, { null: false }
      t.time :end
      t.date :date, { null: false }
      t.integer :participants
      t.string :location, { null: false }

      t.timestamps null: false
    end
  end
end
