class AnswersController < ApplicationController
  
  def create
    question = Question.find(params[:question_id])
    @answer=Answer.new(answer_params)
    question.answers<<@answer

    if @answer.save
      redirect_to question
    else
      redirect_to question, alert: "La respuesta no puede estar vacía"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end