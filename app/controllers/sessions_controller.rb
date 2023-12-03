class SessionsController < ApplicationController


    def new
    end

    def create
        user = User.find_by email: params[:email]
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.destroy
        flash[:success] = "You logout, see you later!!"
        redirect_to root_path
    end
end