class Game < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :player, class_name: 'User', optional: true
  has_many :game_questions, dependent: :destroy
  has_many :questions, through: :game_questions
  has_many :notifications, dependent: :destroy
  after_commit :delete_finished_games

  def delete_finished_games
    Game.where("created_at >= '#{1.day.ago.to_time}' AND status='waiting'").each do |game|
      if (Time.now - game.created_at > 45.minutes)
        game.destroy
      end
    end
  end
end
