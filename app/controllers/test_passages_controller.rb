class TestPassagesController < ApplicationController

    before_action :set_test_passage, only: %i[show update result]

    def show
        
    end

    def result
      @count_of_questions = @test_passage.test.questions.count
      @correct_answers = @test_passage.correct_questions
      @persent_of_success = eval(sprintf("%8.1f",((@test_passage.correct_questions).to_f / @test_passage.test.questions.count)*100))
    end

    def update
        @test_passage.accept!(params[:answer_ids])

        if @test_passage.completed?
            redirect_to result_test_passage_path(@test_passage)
        else
        render :show
        end
    end

    private

    def set_test_passage
       @test_passage = TestPassage.find(params[:id])
    end

end
