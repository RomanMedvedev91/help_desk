class AddReferenceToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :reference, :string
    add_index :tickets, :reference
  end
end
