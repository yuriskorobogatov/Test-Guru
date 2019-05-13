class User < ApplicationRecord

    # has_and_belongs_to_many :tests
    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :author_tests, class_name: 'Test'

    
    def test_list (level)
        Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
            .where("tests.level = ?",level).where("tests_users.user_id = ?", id)
    end
   
    def test_passage(test)
        test_passages.order(id: :desc).find_by(test_id: test.id)
    end

end
