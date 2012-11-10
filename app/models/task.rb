class Task < ActiveRecord::Base

  attr_accessible(
    :name,
    :manager_id,
    :estimated_time,
    :project_id
  )

  validates :manager_id, :name, presence: true

  belongs_to :manager
  belongs_to :project
  has_many :time_trackings

  def live?
    time_trackings.running.any?
  end

  def calc_time_total
    times = []
    if time_trackings.any?
      time_trackings.each do |track|
        if track.stopped_at.nil?
          times << Time.now - time_trackings.running.first.created_at
        else
          times << track.total_time
        end
      end
    end
    elapsed = Time.get_time_diff_components(%w(hour minute), times.inject(0, :+).round)
    elapsed.map!{ |t| Time.format_digit(t) }.join(':')
  end
end
