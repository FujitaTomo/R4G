class CommentsController < ApplicationController
before_action :authenticate_user!, except: [:destroy]
  def create
  	comment = Comment.new(comment_params)
  	comment.user_id = current_user.id
  	comment.board_id = params[:board_id]
  	comment.save
  	redirect_to board_path(comment.board_id)
  end

  def destroy
  	if admin_signed_in?
  		comment = Comment.find(params[:id])
  		comment.destroy
  		redirect_to board_path(comment.board_id)
  	else
  		redirect_to root_path
  	end
  end

  private

  def comment_params
  	  params.require(:comment).permit(:user_id,:board_id,:comment)
  end
end
