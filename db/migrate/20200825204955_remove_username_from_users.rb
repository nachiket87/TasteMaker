class RemoveUsernameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :username, :string
    add_column :users, :name, :string
  end
end
