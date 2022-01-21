class AddModelTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :model, :string
  end
end
