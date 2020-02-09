class VotesController < ApplicationController

	def create	
	  @vote=Vote.new(vote_params)

	  if params[:commAns] == "1"
	  	question = Question.find(params[:idCommAns].to_i)
	  	question.votes<<@vote
	  	puts "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"
	  else
	  	puts "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
	  	question = Question.find(params[:question_id])
	  	answer = Answer.find(params[:idCommAns].to_i)
	  	answer.votes<<@vote
	  end
	  
	  redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id]) 
		vote = Vote.find(params[:id])
		vote.destroy

		redirect_to question
	end

	private
	  def vote_params
	    params.permit(:user_id, :commAns, :idCommAns)
	  end
end