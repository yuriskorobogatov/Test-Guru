class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


   def after_sign_in_path_for(resourse)
    if resourse.admin? 
      admin_tests_path
    else
      tests_path
    end
  end

  def default_url_options
    {lang: I18n.locale} ? {} : {lang: I18n.locale}
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale 
  end

 protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :login])
  end

end
