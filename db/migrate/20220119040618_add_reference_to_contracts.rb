class AddReferenceToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :reference, :string
  end
end
