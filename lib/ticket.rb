class Ticket < ActiveRecord::Base
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
    belongs_to :event
    belongs_to :attendee
end