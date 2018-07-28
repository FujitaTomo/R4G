class GenresController < ApplicationController
  before_action :authenticate_admin!, except:[:ranking,:monthrank,:nextmonthrank,:prevmonthrank]
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
    #ジャンルIDと月初以降でまず取得
    @items = Item.where(genre_id: params[:id]).where('sale_date >= ?', Date.today.beginning_of_month)
    #取得したアイテムをID化
    @item_ids = @items.pluck(:id)
    #ランク化
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    #票無しのデータを作成
    @noranks = @items - @ranks
  end
  
  def monthrank
    @items = Item.where(genre_id: params[:id]).where('sale_date >= ?', Date.today.beginning_of_month).where('sale_date <= ?',Date.today.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  def nextmonthrank
    @items = Item.where(genre_id: params[:id]).where('sale_date >= ?', Date.today.next_month.beginning_of_month).where('sale_date <= ?',Date.today.next_month.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  def prevmonthrank
    @items = Item.where(genre_id: params[:id]).where('sale_date >= ?', Date.today.prev_month.beginning_of_month).where('sale_date <= ?',Date.today.prev_month.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  private
 
    def genre_params
        params.require(:genre).permit(:genre, :priority)
  end
end
