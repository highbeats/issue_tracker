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

  after_save do
    Rails.cache.write("task_#{id}", self)
  end

  after_destroy do
    Rails.cache.destroy("tas#{id}")
  end

  def self.fetch(id)
    Rails.cache.fetch("task_#{id}") { Task.find(id) }
  end

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
    elapsed = Time.get_time_diff_components(%w(hour minute second), times.inject(0, :+).round)
    elapsed.map!{ |t| Time.format_digit(t) }.join(':')
  end

  def time_chart
    grouped = { name: self.name, data: [ ] }
    5.times do |days|
      grouped[:data] << self.time_trackings.map{ |t| t.total_time if t.created_at.to_date == Date.today - days.days }.delete_if{ |x| x.nil? }
    end
    grouped[:data].map!{ |x| x.inject(:+) }
    grouped
  end
end
