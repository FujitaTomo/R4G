class TopsController < ApplicationController
  def top
  	@genres = Genre.all.order(:priority)
  	@hardwares = Hardware.all.order(:priority)
  	@items = Item.order(created_at: :desc).limit(5)
    @votes = Vote.order(created_at: :desc).limit(5)
    @boards = Board.order(created_at: :desc).limit(5)
    @itemranks =Item.where('sale_date >= ?', Date.today.beginning_of_month)
    @item_ids = @itemranks.pluck(:id)
    @ranks = @itemranks.find(Vote.where(item_id: @item_ids).group(:item_id).order("count(item_id) desc").limit(3).pluck(:item_id))
  end
end
