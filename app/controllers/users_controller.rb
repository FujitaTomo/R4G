class UsersController < ApplicationController
  def index
  end

  def show
    @votes = Vote.where(user_id: params[:id])
  end

  def index
  end

  def destroy
  end
end
