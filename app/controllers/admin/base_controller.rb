class Admin::BaseController < ApplicationController

    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    private
 
    def admin_required!
<<<<<<< HEAD
       redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
=======
        redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
>>>>>>> 67939b91a2eed1f352920c9b71b45dea3d3da2ed
    end
end