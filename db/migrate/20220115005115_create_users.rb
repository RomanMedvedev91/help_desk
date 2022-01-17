class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :user_type, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
