class AddAcceptedToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :accepted, :boolean
  end
end
