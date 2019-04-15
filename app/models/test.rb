class Test < ApplicationRecord

  has_many :users, through: :user_test_throughs
  has_many :user_test_throughs
  has_many :questions
  

  

  def self.show_tests(category)
    Test.joins(' JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category)
    .order(title: :desc).pluck(:title)
  end

end
