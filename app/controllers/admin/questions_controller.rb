class Admin::QuestionsController < ApplicationController
    layout 'admin'
    def index
        @pagy, @questions = pagy Question.all
    end
    
end