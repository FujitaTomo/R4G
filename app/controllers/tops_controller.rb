class TopsController < ApplicationController
  def top
  	@genres = Genre.all.order(:priority)
  	@hardwares = Hardware.all.order(:priority)
  	@items = Item.order(created_at: :desc).limit(5)
    @votes = Vote.order(created_at: :desc).limit(5)
    @boards = Board.order(created_at: :desc).limit(5)
  end
end
