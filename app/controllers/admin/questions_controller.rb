class Admin::QuestionsController < ApplicationController
    before_action :set_question, only: %i[show destroy edit update]
    add_flash_types :warning

    layout 'admin'
    include Admin::AdminHelper


    def new
        @question = Question.new
    end


    def create
        @question = Question.new question_params
        if @question.save
            flash[:success] = "Question created with admin"
            redirect_to admin_questions_path
        else
            render :new
        end
    end

    def index
        @pagy, @questions = pagy Question.accessible_by(current_ability).order(created_at: :desc)
        authorize! :show, @questions
    end

    
    def show
        @answer = @question.answers.build
        @answers = @question.answers.all
        
    end

    def edit
    end

    def update
        if @question.update question_params
            flash[:success] = "Question updated"
            redirect_to admin_questions_path
        else
            render :edit
        end
    end

    def destroy
        @question.destroy 
        flash[:success] = "Question deletedddddddddddddd"
        redirect_to admin_questions_path
    end

    private 
    def question_params
        params.require(:question).permit(:title, :body)
    end

    def set_question
        @question = Question.find params[:id]
    end
end