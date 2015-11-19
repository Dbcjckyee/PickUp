class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :event_name
      t.text :description
      t.string :sport
      t.timestamp :start
      t.timestamp :end
      t.integer :participants
      t.string :location

      t.timestamps null: false
    end
  end
end
