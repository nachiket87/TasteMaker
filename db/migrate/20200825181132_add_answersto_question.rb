class AddAnswerstoQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :answers, :text
  end
end
