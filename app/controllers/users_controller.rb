class UsersController < ApplicationController
  ## Index is serving as a search engine!
  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags
  end
end
