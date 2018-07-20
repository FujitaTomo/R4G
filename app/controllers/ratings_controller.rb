class RatingsController < ApplicationController
  def index
  	@rating = Rating.new
  	@ratings = Rating.all
  end

  def create
  	rating = Rating.new(rating_params)
  	rating.save
  	redirect_to ratings_path
  end

  def destroy
  	rating = Rating.find(params[:id])
  	rating.destroy
  	redirect_to ratings_path
  end
  private
 
    def rating_params
        params.require(:rating).permit(:rating)
  end
end
