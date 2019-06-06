class Admin::QuestionsController < Admin::BaseController

    before_action :authenticate_user!
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
<<<<<<< HEAD:app/controllers/admin/questions_controller.rb
         redirect_to @question
=======
         redirect_to admin_question_path(@question.id)       
>>>>>>> 67939b91a2eed1f352920c9b71b45dea3d3da2ed:app/controllers/admin/questions_controller.rb
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
<<<<<<< HEAD:app/controllers/admin/questions_controller.rb
         redirect_to @question
=======
         redirect_to admin_question_path       
>>>>>>> 67939b91a2eed1f352920c9b71b45dea3d3da2ed:app/controllers/admin/questions_controller.rb
      else
        ["Error!", @question.errors.full_messages, "Question can not be updated!"]
        render :edit
      end
    end
  
    def destroy
      @question.destroy
      redirect_to admin_test_path(@question.test.id)
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
