class BoardsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show,:destroy]
  def index
  	@board = Board.new
  	@boards = Board.order('id DESC').page(params[:page]).per(10)
  end

  def create
  	board = Board.new(board_params)
  	board.user_id = current_user.id
  	if board.save
  	  redirect_to boards_path
    else
      redirect_to boards_path
    end
  end

  def show
  	@board = Board.find(params[:id])
  	@comment = Comment.new
  	@comments = Comment.where(board_id: @board.id).page(params[:page]).per(20)
  end

  def destroy
  	if admin_signed_in?
	  	board = Board.find(params[:id])
	  	board.destroy
	  	redirect_to boards_path
  	else
  		redirect_to root_path
  	end
  end

  private
 
  def board_params
  	  params.require(:board).permit(:user_id,:board_title)
  	end
end
