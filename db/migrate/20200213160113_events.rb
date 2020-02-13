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