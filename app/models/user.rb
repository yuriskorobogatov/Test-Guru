
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

    attr_reader :password
    attr_writer :password_confirmation

    has_many :gists
    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :author_tests, class_name: 'Test'

    validates :email, presence: :true,
                      uniqueness: true, 
                      :format => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def test_list (level)
        Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
            .where("tests.level = ?",level).where("tests_users.user_id = ?", id)
    end

    def test_passage(test)
        test_passages.order(id: :desc).find_by(test_id: test.id)
    end

    def admin?
        self.is_a?(Admin)
    end
end
