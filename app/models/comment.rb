class Comment < ActiveRecord::Base
  attr_accessible :content, :manager_id, :ticket_id

  belongs_to :ticket
  belongs_to :manager

  after_create :notify_customer

  validates :content, presence: true

  private

  def notify_customer
    Notifier.new_ticket_comment(self.ticket).deliver
  end
end
