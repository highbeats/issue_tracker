class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :target_id
      t.integer :ticket_id
      t.string :content

      t.timestamps
    end
  end
end
