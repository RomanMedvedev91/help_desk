class CreateContractProducts < ActiveRecord::Migration
  def change
    create_table :contract_products do |t|
      t.references :contract, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :serial_number

      t.timestamps null: false
    end
  end
end
