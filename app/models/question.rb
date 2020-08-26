class Question < ApplicationRecord
  serialize :answers, Hash
  belongs_to :game_questions

  def all_answers
    all_options = self.answers[:incorrect]
    all_options << self.answers[:correct]
    return all_options
  end

end
