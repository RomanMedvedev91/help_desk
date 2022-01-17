class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service_level_agreement, index: true, foreign_key: true
      t.datetime :sla_valid_start_date
      t.datetime :sla_valid_end_date

      t.timestamps null: false
    end
  end
end
