class Test < ApplicationRecord

  #has_and_belongs_to_many :users

  has_many :test_passages
  has_many :users, through: :test_passages
  
  has_and_belongs_to_many :categories
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :simple_level, ->  { where(level: 0..1)}
  scope :average_level, -> { where(level: 2..4)}
  scope :high_level, ->    { where(level: 4..Float::INFINITY)}
  scope :show_tests, -> (category) {Test.joins('JOIN categories_tests ON tests.id = categories_tests.test_id')
    .where('categories_tests.category_id = ?', Category.where(title: category).ids)
    .order(title: :desc).pluck(:title)}

end
