class CreateGameQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_questions do |t|
      t.integer :order_number

      t.timestamps
    end
  end
end
