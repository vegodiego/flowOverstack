class CommentsController < ApplicationController
  
  def create
    @comment=Comment.new(comment_params)

    if params[:commAns] == "1"
      question = Question.find(params[:idCommAns].to_i)
      question.comments<<@comment
    else
      question = Question.find(params[:question_id])
      answer = Answer.find(params[:idCommAns].to_i)
      answer.comments<<@comment
    end

    if @comment.save
      redirect_to question
    else
      redirect_to question, alert: "El comentario no puede estar vacío"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :commAns, :idCommAns)
    end
end