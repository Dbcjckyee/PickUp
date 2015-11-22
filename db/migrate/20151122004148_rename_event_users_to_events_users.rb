class RenameEventUsersToEventsUsers < ActiveRecord::Migration
  def change
    rename_table :event_users, :events_users
  end
end
