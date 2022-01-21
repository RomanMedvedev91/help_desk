class AddCategoryIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :category_id, :integer
    add_index :tickets, :category_id
  end
end
