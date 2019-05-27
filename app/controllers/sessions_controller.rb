class SessionsController < ApplicationController

  #для отображения формы
  def new
  end

  #создание пользовательской сессии
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      #именно метод session создает сеестию в куке
      session[:user_id] = user.id
      #тут поставить путь из запроса
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
  	session[:user_id] = nil 
  	redirect_to 'http://localhost:3000/index', notice: "Goodbye!"
  end
end
