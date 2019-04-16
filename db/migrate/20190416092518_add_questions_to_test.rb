class AddQuestionsToTest < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :tests
  end
end
