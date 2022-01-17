class CreateQas < ActiveRecord::Migration
  def change
    create_table :qas do |t|
      t.references :qa_category, index: true, foreign_key: true
      t.text :problem, null:false
      t.text :solution, null:false

      t.timestamps null: false
    end
  end
end
