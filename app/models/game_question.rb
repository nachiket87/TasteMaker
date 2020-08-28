class GameQuestion < ApplicationRecord
  belongs_to :game
  belongs_to :question
  belongs_to :user, class_name: 'User', optional: true
end
