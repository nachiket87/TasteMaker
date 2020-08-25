class AddUserReferencetoGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :host, foreign_key: { to_table: "users" }
    add_reference :games, :player, foreign_key: { to_table: "users" }
  end
end
