class User < ApplicationRecord

    def test_list (level)
        @level = level
        @all_test_of_level = Test.where("level = ?", @level)
        return @all_test_of_level
    end

end
