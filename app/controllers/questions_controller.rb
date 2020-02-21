class QuestionsController < ApplicationController

    before_action :authenticate_user!, :only => [:new]

    def index
        @question=Question.all.reverse
    end

    def new
        @question=Question.new
    end

    def show
        @user=current_user
        @question=Question.find(params[:id])
        @comment=Comment.new
        @vote=Vote.new
        @questionComments=Question.find(params[:id]).comments

        if user_signed_in?
            @question.votes.each do |i|
                if current_user.id == i.user_id
                    @voteExist = true
                    @voteE = i
                end
            end
        end

        @questionAnswer=@question.answers.reverse
        @answer=Answer.new
    end

    def create
        @question = Question.new(question_params)
        current_user.questions<<@question
        if @question.save
            redirect_to questions_path
        else
            render :new
        end
    end

    private
        def question_params
            params.require(:question).permit(:title, :content)
        end
end