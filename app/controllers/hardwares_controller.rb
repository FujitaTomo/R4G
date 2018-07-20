class HardwaresController < ApplicationController
  def index
  	@hardware = Hardware.new
  	@hardwares = Hardware.all
  end

  def create
  	hardware = Hardware.new(genre_params)
  	hardware.save
  	redirect_to hardwares_path
  end

  def destroy
  	hardware = Hardware.find(genre[:id])
  	hardware.destroy
  	redirect_to hardwares_path
  end

  def ranking
    @items = Item.where(hardware_id: params[:id]).where('sale_date >= ?', Date.today.beginning_of_month)
    @item_ids = @items.pluck(:id)
    @ranks = @items.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(100).pluck(:item_id))
    @noranks = @items - @ranks
  end

  private
 
    def genre_params
        params.require(:hardware).permit(:hardware, :priority)
  end
end
