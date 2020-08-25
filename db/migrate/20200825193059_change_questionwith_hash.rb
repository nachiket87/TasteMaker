class ChangeQuestionwithHash < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :answers 
    add_column :questions, :answers, :json
  end
end
