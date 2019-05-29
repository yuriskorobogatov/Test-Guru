class SessionsController < ApplicationController

  #для отображения формы
  def new
  end

  #создание пользовательской сессии
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:current_url] || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :current_url
  	redirect_to index_path
  end
end
