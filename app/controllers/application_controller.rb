class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resourse)
    if resourse.is_a?(Admin)  
      admin_tests_path
    else
      tests_path
    end
  end

 protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :login])
  end

end
