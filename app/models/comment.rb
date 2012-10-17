class Comment < ActiveRecord::Base
  attr_accessible :content, :manager_id, :ticket_id

  belongs_to :ticket
end
