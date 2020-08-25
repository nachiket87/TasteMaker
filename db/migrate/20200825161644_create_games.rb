class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :host_score
      t.integer :player_score
      t.integer :turn_number

      t.timestamps
    end
  end
end
