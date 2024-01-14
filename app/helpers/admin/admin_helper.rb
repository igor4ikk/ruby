module Admin::AdminHelper

    def redirect_adminmain
        redirect_to admin_pages_path
    end

    def current_user
        @current_user ||= Adminuser.find_by(id: session[:adminuser_id]) if session[:adminuser_id].present? 
    end

    def user_signed_in?
        current_user.present?
    end

end
