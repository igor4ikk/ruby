class Admin::AdminsessionsController < ApplicationController
    layout 'admin'
    include Admin::AdminHelper

    def new
    end

    def create
        adminuser = Adminuser.find_by email: params[:email]
        if adminuser&.authenticate(params[:password])
            session[:adminuser_id] = adminuser.id
            redirect_adminmain
        else
            redirect_to new_admin_adminsession_path
        end
    end

    def destroy
        session.destroy
        flash[:success] = "You logout, see you later!!"
        redirect_to new_admin_adminsession_path
    end

end