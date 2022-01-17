class CreateServiceLevelAgreements < ActiveRecord::Migration
  def change
    create_table :service_level_agreements do |t|
      t.string :code, null:false
      t.text :description
      t.integer :business_days
      t.integer :business_hours

      t.timestamps null: false
    end
  end
end
