class AddTechnicianToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :technician_id, :integer
  end
end
