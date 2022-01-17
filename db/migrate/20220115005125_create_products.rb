class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.string :code, null:false
      t.text :description
      t.string :model

      t.timestamps null: false
    end
  end
end
