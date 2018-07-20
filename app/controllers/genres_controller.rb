class GenresController < ApplicationController
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to genres_path
  end

  def destroy
  	genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path
  end

  def ranking
    @items = Item.where(genre_id: params[:id]).where('sale_date >= ?', Date.today.beginning_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  private
 
    def genre_params
        params.require(:genre).permit(:genre, :priority)
  end
end
