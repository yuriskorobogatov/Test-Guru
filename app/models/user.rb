class User < ApplicationRecord

    has_many :tests, through: :user_test_throughs
    has_many :user_test_throughs


    def test_list (level)
        Test.joins('JOIN user_test_throughs ON tests.id = user_test_throughs.test_id')
            .where("tests.level = ?",level).where("user_test_throughs.user_id = ?", id)
    end

end
