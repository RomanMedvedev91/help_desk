class CreateStatTechnicians < ActiveRecord::Migration
  def change
    create_table :stat_technicians do |t|
      t.string :name
      t.date :this_date
      t.integer :assigned
      t.integer :solved
      t.integer :transferred
      
      t.timestamps null: false
    end
  end
end

