class Game < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :player, class_name: 'User'
  has_many :game_questions
  has_many :questions, through: :game_questions
end
