class UsersController < ApplicationController
  def index
  end

  def show
    @votes = Vote.where(user_id: params[:id])
  end

  def index
    @usearch = User.ransack(params[:q])
    @users = @usearch.result
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_top_path
  end
end
