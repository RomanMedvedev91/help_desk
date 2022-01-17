class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :ticket, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
