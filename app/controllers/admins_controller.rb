class AdminsController < ApplicationController
  def top
  	@search = Item.ransack(params[:q])
    @items = @search.result
    @usearch = User.ransack(params[:q])
    @users = @usearch.result
  end

  private
  
  def search_params
    params.require(:q).permit!
  end
end
