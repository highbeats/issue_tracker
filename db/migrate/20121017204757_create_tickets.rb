class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :customer
      t.string :uid
      t.string :email
      t.string :subject
      t.text :question
      t.string :status
      t.integer :manager_id
      t.integer :department_id

      t.timestamps
    end
  end
end
