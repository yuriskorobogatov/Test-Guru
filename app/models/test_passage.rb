class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def sum_questions
    test.questions.count
  end

  def number_of_question
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

 
  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    #можем вызвать .correct поскольку у нас есть такой scope в модели answer
    current_question.answers.correct
  end

    #экземпляр test здесь можно использовать поскольку у нас есть belongs_to :test
    #т.е. связность моделей позволяет использовать связные экземпляры этих моделей
  def next_question
    # запись 'id > ?', current_question.id означает что выбираются только те вопросы, у которых id больше чем у текущего
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
