class QuestionsController < ApplicationController

    before_action :set_test, only: [:index, :create, :new]
    before_action :set_question, only: [:show, :destroy, :edit]
  
    rescue_from ActiveRecord::RecordNotFound, with: :question_not_found
  
      #Список вопросов теста и сам тест
    def index
      @test_name = @test.title
      @result = @test.questions
    end
  
    def show
     
    end
  
    def new
      @question = @test.questions.new
    end
  
    def create
      @question = @test.questions.new(question_params)
  
      if @question.save
         redirect_to @question        
      else
        ["Error!", @question.errors.full_messages, "Question can not be created!"]
        render :new
      end
    end
    #чтобы получить ресурс
    def edit
     
    end
    #чтобы обновить ресурс
    def update 
      @question = Question.find(params[:id])
  
      if @question.update(question_params)
         redirect_to @question        
      else
        ["Error!", @question.errors.full_messages, "Question can not be updated!"]
        render :edit
      end
    end
  
    def destroy
      @question.destroy
      redirect_to "/tests/#{@question.test_id}"
    end
  
    private
  
    def set_test
      @test = Test.find(params[:test_id])
    end
  
    def set_question
      @question = Question.find(params[:id])
    end
  
    def question_params
      #параметр :test_id тут не добавляю т.к. получаю его через ассоциации
      params.require(:question).permit(:body)
    end
  
    def question_not_found
      render plain: 'Question was not found'
    end

end
