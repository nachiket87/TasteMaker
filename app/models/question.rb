class Question < ApplicationRecord
  serialize :answers, Hash
end
