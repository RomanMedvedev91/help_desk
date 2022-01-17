class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :contract_product, index: true, foreign_key: true
      t.references :ticket_priority, index: true, foreign_key: true
      t.references :ticket_status_code, index: true, foreign_key: true
      t.references :ticket_type, index: true, foreign_key: true
      t.text :problem_description, null:false
      t.text :solution_description
      t.datetime :assigned_at
      t.datetime :closed_at
      t.datetime :to_be_solved_at

      t.timestamps null: false
    end
  end
end
