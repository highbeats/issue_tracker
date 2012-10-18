class Comment < ActiveRecord::Base
  attr_accessible :content, :manager_id, :ticket_id

  belongs_to :ticket

  after_create :notify_customer

  private

  def notify_customer
    Notifier.new_ticket_comment(self.ticket).deliver
  end
end
