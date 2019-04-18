class AddQuestionToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :answers, :questions
  end
end
