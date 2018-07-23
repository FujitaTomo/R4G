class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.admin_id = current_admin.id
    item.save
    redirect_to items_path
  end

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result
  end

  def show
    @item = Item.find(params[:id])
    @votes = Vote.where(item_id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def ranking
    @items =Item.where('sale_date >= ?', Date.today.beginning_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  def monthrank
    @items = Item.where('sale_date >= ?', Date.today.beginning_of_month).where('sale_date <= ?',Date.today.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  def nextmonthrank
    @items = Item.where('sale_date >= ?', Date.today.next_month.beginning_of_month).where('sale_date <= ?',Date.today.next_month.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  def prevmonthrank
    @items = Item.where('sale_date >= ?', Date.today.prev_month.beginning_of_month).where('sale_date <= ?',Date.today.prev_month.end_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  private
 
  def item_params
      params.require(:item).permit(:admin_id,:title,:price,:genre_id,:label_id,:rating_id,:sale_date,:amazon,:official,:steam,:hardware_id,:image)
  end
end
