class TestPassagesController < ApplicationController

  before_action :authenticate_user!  
  before_action :set_test_passage, only: %i[show update result gist]

    def show
       
    end

    def result
      @count_of_questions = @test_passage.test.questions.count
      @correct_answers = @test_passage.correct_questions
      @persent_of_success = @test_passage.persent_of_success
      @check_test = @test_passage.check_test
      @color_for_message = @test_passage.color_for_message
    end

    def update
        @test_passage.accept!(params[:answer_ids])
        
        if @test_passage.completed?
          TestsMailer.completed_test(@test_passage).deliver_now
          redirect_to result_test_passage_path(@test_passage)
        else
          render :show
        end
    end

    def gist
      gist_service = GistQuestionService.new(@test_passage.current_question)
      result = gist_service.call
      
      flash_options = if gist_service.success?
        gist_url = result.html_url
        gist_url_tag = %Q[<a href="#{gist_url}" target="_blank">gist.github.com</a>]
        current_user.gists.create(question: @test_passage.current_question,
                                  gist_url: gist_url)
        { notice: t('.success', url: gist_url_tag) }
      else
        { alert: t('.failure') }
      end

      redirect_to @test_passage, flash_options
    end

    private

    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end

end