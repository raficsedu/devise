class CreateTicketLoops < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_loops do |t|
      t.integer :ticket_id
      t.integer :role
      t.string :description, null: false, default: ""
      t.timestamps
    end
  end
end
