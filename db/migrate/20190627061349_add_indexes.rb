class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, :user_id
    add_index :tests, %i[title level], unique: true
  end
end
