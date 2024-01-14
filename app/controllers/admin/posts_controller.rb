class Admin::PostsController < ApplicationController 
    before_action :set_post, only: %i[show destroy edit update]

    layout 'admin'
    include Admin::AdminHelper



    def index
        @posts = Post.order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
            @post = Post.new post_params
            if @post.save
            flash[:success] = "Post created with admin"
            redirect_to admin_posts_path
        else
            return :new
        end
    end

    def show
    end

    def edit
    end

    def update
            @post.update post_params
            flash[:success] = "Post updated with admin"
            redirect_to admin_posts_path
    end

    def destroy
        @post.destroy
        flash[:success] = "Post deleted with admin"
        redirect_to admin_posts_path
    end


    private 

    def post_params
        params.require(:post).permit(:title, :body, :preview_img)
    end

    def set_post
        @post = Post.find params[:id]
    end
end