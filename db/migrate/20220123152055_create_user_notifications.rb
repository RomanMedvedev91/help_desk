class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.string :notification_type
      t.integer :send_email
      t.integer :send_sms
      t.timestamp :email_sent_at
      t.timestamp :sms_sent_at

      t.timestamps null: false
    end
  end
end
