class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :time_spent
      t.integer :manager_id
      t.datetime :last_updated_at
      t.datetime :started_at
      t.datetime :stopped_at
      t.boolean :in_progress, :default => false

      t.timestamps
    end
  end
end
