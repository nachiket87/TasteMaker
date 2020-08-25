class AddWinnerToGameQuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_questions, :user, foreign_key: true
  end
end
