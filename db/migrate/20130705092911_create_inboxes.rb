class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.integer :user_id
      t.integer :message_id
      t.boolean :read

      t.timestamps
    end
  end
end
