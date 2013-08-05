class AddUnreadToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :unread, :boolean, default: true
  end
end
