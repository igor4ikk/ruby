class AnswersController < ApplicationController
    before_action :set_question!

    def create
        @answer = @question.answers.build answer_params
        if @answer.save 
            flash[:success] = "Question created"
            redirect_to question_path(@question)
        else
            @answers = @question.answers.all
            render 'questions/show'
        end
    end

    def new
        @answer = Answers.build
    end

    def destroy
        @answer = @question.answers.find params[:id]
        @answer.destroy
        flash[:success] = "Question deleted"
        redirect_to question_path(@question)
    end 

    def edit
        @answer = @question.answers.find params[:id]
    end

    def update
        @answer = @question.answers.find params[:id]
       if @answer.update answer_params
        flash[:success] = "Question updated"
          redirect_to question_path(@question)
        else
            render :edit
        end
    end

    private
        def answer_params
            params.require(:answer).permit(:body)
        end

        def set_question!
            @question = Question.find params[:question_id]
        end

end