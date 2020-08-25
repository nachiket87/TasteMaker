class AddGameQuestionIDtoGq < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_questions, :game, foreign_key: { to_table: "games" }
    add_reference :game_questions, :winner, foreign_key: { to_table: "users" }
    add_reference :game_questions, :question, foreign_key: { to_table: "questions" }
  end
end
