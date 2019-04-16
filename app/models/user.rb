class User < ApplicationRecord

    has_and_belongs_to_many :tests
    

    def test_list (level)
        Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
            .where("tests.level = ?",level).where("tests_users.user_id = ?", id)
    end

end
