class Ticket < ActiveRecord::Base
  attr_accessible :customer, :department_id, :email, :manager_id, :question, :status, :subject, :uid
end
