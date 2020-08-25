class GameQuestion < ApplicationRecord
  has_many :questions
  belongs_to :game
end
