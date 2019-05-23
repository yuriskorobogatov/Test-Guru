require 'digest/sha1'

class User < ApplicationRecord

    attr_reader :password
    attr_writer :password_confirmation

    has_many :test_passages
    has_many :tests, through: :test_passages
    has_many :author_tests, class_name: 'Test'

    validates :email, presence: :true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true

    
    
    def test_list (level)
        Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
            .where("tests.level = ?",level).where("tests_users.user_id = ?", id)
    end
   
    def test_passage(test)
        test_passages.order(id: :desc).find_by(test_id: test.id)
    end

    def authenticate(password_string)
        digest(password_string) == self.password_digest ? self :false
    end

    def password=(password_string)
        if password_string.nil?
            self.password_digest = nil
        elsif password_string.present?
            @password = password_string
            self.password_digest = digest(password_string)
        end
    end

    private

    def digest(string)
        str = string.to_s
        Digest::SHA1.hexdigest(str)
    end
end
