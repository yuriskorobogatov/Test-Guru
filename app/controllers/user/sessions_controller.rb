class User::SessionsController < Devise::SessionsController

    def create
        super
        flash[:notice] = "Привет, #{current_user.login}!" if is_flashing_format?
      end
end
