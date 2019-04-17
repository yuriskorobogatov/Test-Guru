class Test < ApplicationRecord

  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
  has_many :questions
  belongs_to :user

  

  def self.show_tests(category)
    Test.joins(' JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category)
    .order(title: :desc).pluck(:title)
  end

end
