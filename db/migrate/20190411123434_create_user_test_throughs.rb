class CreateUserTestThroughs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_test_throughs do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
