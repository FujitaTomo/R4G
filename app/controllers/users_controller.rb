class UsersController < ApplicationController
  before_action :authenticate_admin!, except:[:show]
  def show
       @votes = Vote.where(user_id: params[:id])
       @boards = Board.where(user_id: params[:id])
       @contacts = Contact.where(user_id: params[:id])
  end

  def index
    @usearch = User.ransack(params[:q])
    @users = @usearch.result.page(params[:page]).per(20)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_top_path
  end
end
