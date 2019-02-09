class CommentsController < ApplicationController

  before_action :authenticate_user!

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Se ha añadido tu comentario!"
		else
			flash[:danger] = "#{@comment.errors.messages}"
		end

    comment_params[:commentable_type] == 'Question'
        redirect_to question_path(comment_params[:commentable_id])

  end

  private

    def comment_params
      params.require(:comment).permit(:commentable_type, :commentable_id,:body, :user_id)
    end

end
