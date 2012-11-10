class CreateTimeTrackings < ActiveRecord::Migration
  def change
    create_table :time_trackings do |t|
      t.integer :manager_id
      t.integer :task_id
      t.datetime :started
      t.datetime :stopped_at
      t.integer :total_time

      t.timestamps
    end
  end
end
