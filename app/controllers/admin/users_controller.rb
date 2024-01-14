class Admin::UsersController < ApplicationController
    layout 'admin'
    include Admin::AdminHelper
    
    def index
        @users = User.order(created_at: :desc)
        authorize! :show, @users
    end

end 