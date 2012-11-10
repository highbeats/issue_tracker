class AddEstimatedTimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :estimated_time, :string
  end
end
