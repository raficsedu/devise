class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :user_id
      t.integer :agent_id, null: true
      t.integer :status
      t.timestamps
    end
  end
end
