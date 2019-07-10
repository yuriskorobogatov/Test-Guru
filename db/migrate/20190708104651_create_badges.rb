class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :reward_link
      t.integer :rule_id

      t.timestamps
    end
  end
end
