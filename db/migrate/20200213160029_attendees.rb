class Attendees < ActiveRecord::Migration[5.2]
  def change
      create_table :attendees do |t|
        t.string :name
      end
  end
end
