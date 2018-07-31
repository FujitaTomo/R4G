class VotesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :abc, only:[:create]
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
    if admin_signed_in?
      vote.destroy
      redirect_to votes_path
    else
      if vote.user != current_user
        redirect_to item_path(vote.item_id)
      end
    vote.destroy
    redirect_to item_path(vote.item_id)
    end
  end

  def index
    @votes = Vote.page(params[:page]).per(50)
  end

  private
  	def vote_params
  	  params.require(:vote).permit(:user_id,:item_id,:favo,:comment,:user_name)
  	end
    def abc
      if Vote.find_by(user_id: current_user.id,item_id: params[:item_id]).nil?
      else
        redirect_to item_path(params[:item_id])
      end
    end
end
