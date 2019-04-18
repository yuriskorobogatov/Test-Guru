class CreateJoinTableCategoryTest < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :tests do |t|
       t.index [:category_id, :test_id], unique: true
      # t.index [:test_id, :category_id]
    end
  end
end
