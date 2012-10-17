class Ticket < ActiveRecord::Base

  STATUSES = [
    'Waiting for Staff Response',
    'Waiting for customer',
    'On hold',
    'Cancelled',
    'Completed'
  ]

  attr_accessible(
    :customer,
    :department_id,
    :email,
    :manager_id,
    :question,
    :status,
    :subject
  )

  has_many :comments
  has_many :events
  belongs_to :manager
  belongs_to :department

  validates :customer, presence: true, length: { maximum: 100 }
  validates :question, presence: true, length: { maximum: 600 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :subject, presence: true, length: { maximum: 100 }
  validates :department_id, :email, :uid, presence: true

  before_validation :set_uid, :set_status, on: :create

  private

  def set_uid
    self.uid = SecureRandom.uuid
  end

  def set_status
    self.status = 'Waiting for Staff Response'
  end
end
