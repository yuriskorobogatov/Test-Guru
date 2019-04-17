class AddUserIdToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :user_id, :integer
    remove_column :tests, :category_id
  end
end
