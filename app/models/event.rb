class Event < ActiveRecord::Base
  attr_accessible :content, :target_id, :ticket_id
  belongs_to :ticket
end
