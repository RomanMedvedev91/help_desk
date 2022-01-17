class CreateTicketStatusCodes < ActiveRecord::Migration
  def change
    create_table :ticket_status_codes do |t|
      t.string :code, null:false
      t.text :description

      t.timestamps null: false
    end
  end
end
