class AddProductIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :product_id, :integer
    add_index :tickets, :product_id
  end
end
