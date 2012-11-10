class TimeTracking < ActiveRecord::Base
  attr_accessible :stopped_at, :task_id, :manager_id, :total_time

  belongs_to :task
  belongs_to :manager

  validates :manager_id, :task_id, presence: true, on: :create

  before_validation(on: :create) do |t|
    t.manager_id = t.task.manager_id unless t.task.nil?
  end

  scope :running, where(stopped_at: nil)
  scope :users_recent, -> user { where(manager_id: user.id).order(:stopped_at).limit(10) }

  def self.terminate(track)
    track.stopped_at = Time.now
    track.total_time = (Time.now - track.created_at)
    track.save!
  end
end
