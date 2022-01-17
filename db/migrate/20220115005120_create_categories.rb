class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :code, null:false
      t.text :description

      t.timestamps null: false
    end
  end
end
