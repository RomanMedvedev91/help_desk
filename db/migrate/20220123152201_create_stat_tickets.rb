class CreateStatTickets < ActiveRecord::Migration
  def change
    create_table :stat_tickets do |t|
      t.string :code
      t.integer :no_of_tickets
      t.string :record_type
      t.date :this_date

      t.timestamps null: false
    end
  end
end
