class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.string :code, null:false
      t.text :description

      t.timestamps null: false
    end
  end
end
