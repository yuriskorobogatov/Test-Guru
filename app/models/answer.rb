class Answer < ApplicationRecord
    belongs_to :question

    scope :correct, ->  { where(correct: true)}

    validates :body, presence: true
    validate :validate_quantity, on: :create

    def validate_quantity
      #errors.add(:quantity, "Maximum is 4 answers") if question.answers.size >= 4
    end
end
