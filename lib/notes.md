we are trying to link attendees to their corresponding tickets via order

how can we make an order have multiple tickets and be able to recognize the order by the attendee_id or them entering their name

do we need to change our schema to have an order_id on both the attendee and the ticket 


class Attendees < ActiveRecord::Migration[5.2]
  def change
      create_table :attendees do |t|
        t.string :name
      end
  end
end

class Tickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :attendee_id
      t.integer :event_id
    end
  end
end

class Events < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :venue
      t.string :date
      t.string :time
    end
  end
end