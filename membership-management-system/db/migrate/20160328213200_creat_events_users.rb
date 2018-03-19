class CreatEventsUsers < ActiveRecord::Migration
  def self.up
    create_table :events_users, :id => false do |t|
        t.references :event
        t.references :user
    end
    add_index :events_users, [:event_id, :user_id]
    add_index :events_users, :user_id
  end

  def self.down
    drop_table :events_users
  end
end
