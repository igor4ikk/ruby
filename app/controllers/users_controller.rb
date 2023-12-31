class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create user_params
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Your are logined Wellcome"
            redirect_to root_path
        else
            render :new
        end
    end


    private
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end   