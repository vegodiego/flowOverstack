class QuestionsController < ApplicationController
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


=begin
	
	def show
		@post=Post.find(params[:id])
		@comment=Comment.new
		@postComments=Post.find(params[:id]).comments
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  if @post.update(post_params)
	    redirect_to posts_path, notice: "El post fue modificado exitosamente"
	  else
	    render :edit
	  end
	end

	def destroy
	  post = Post.find(params[:id])
	  post.destroy

	  redirect_to posts_path, notice: "El post fue eliminado con éxito"
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :body)
	  end
=end
end