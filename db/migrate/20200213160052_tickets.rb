class Tickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :attendee_id
      t.integer :event_id
    end
  end
end
