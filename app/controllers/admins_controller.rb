class AdminsController < ApplicationController
  def top
  	@search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(20)
    @usearch = User.ransack(params[:q])
    @users = @usearch.result.page(params[:page]).per(20)
  end

  private
  
  def search_params
    params.require(:q).permit!
  end
end
