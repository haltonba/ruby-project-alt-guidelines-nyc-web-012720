class Event < ActiveRecord::Base
    has_many :tickets
    has_many :attendees, through: :tickets
end