class AddSerialNumberTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :serial_number, :string
  end
end
