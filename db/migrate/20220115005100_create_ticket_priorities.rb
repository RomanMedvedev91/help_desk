class CreateTicketPriorities < ActiveRecord::Migration
  def change
    create_table :ticket_priorities do |t|
      t.string :code, null:false
      t.text :description
      t.integer :business_days
      t.integer :business_hours
      
      t.timestamps null: false
    end
  end
end


