class VotesController < ApplicationController
  before_action :authenticate_user!
  def new
  	@item = Item.find(params[:item_id])
	@vote = Vote.new
  end

  def create
  	@vote = Vote.new(vote_params)
  	@vote.user_id = current_user.id
  	@vote.item_id = params[:item_id]
  	@vote.save
  	redirect_to item_path(params[:item_id])
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    redirect_to item_path(vote.item_id)
  end

  private
  	def vote_params
  	  params.require(:vote).permit(:user_id,:item_id,:favo,:comment,:user_name)
  	end
end
