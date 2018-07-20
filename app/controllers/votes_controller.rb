class VotesController < ApplicationController
  def new
  	@item = Item.find(params[:item_id])
	@vote = Vote.new
  end

  def create
  	@vote = Vote.new(vote_params)
  	@vote.user_id = current_user.id
  	@vote.item_id = params[:item_id]
  	@vote.save
  	redirect_to root_path
  end

  def destroy
  end

  private
  	def vote_params
  	  params.require(:vote).permit(:user_id,:item_id,:favo,:comment)
  	end
end
