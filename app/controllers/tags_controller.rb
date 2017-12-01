class TagsController < ApplicationController

  def index
    @photo = Photo.find(params[:photo_id])
    @tags = @photo.tags
  end

  def new
    @user = current_user
    @users = User.all
    @photo = Photo.find(params[:photo_id])
    @tag = @photo.tags.new
  end

  def create
    @user = current_user
    @users = User.all
    @photo = Photo.find(params[:photo_id])
    @tag = @photo.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "tag successfully added!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "tag successfully updated!"
      redirect_to  tag_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "tag successfully deleted!"
    redirect_to root_path
  end

  private
  def tag_params
    params.require(:tag).permit(:tag, :user_id, :photo_id)
  end
end
