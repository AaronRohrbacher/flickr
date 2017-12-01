class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def user_photos
    @user = current_user
    @photos = @user.photos
  end

  def new
    @user = current_user
    @photo = @user.photos.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "photo successfully added!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "photo successfully updated!"
      redirect_to  photo_path
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "photo successfully deleted!"
    redirect_to root_path
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.upvote_by current_user
    @photos = Photo.all
    redirect_to photos_path
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.downvote_by current_user
    @photos = Photo.all
    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :user_id) ## Rails 4 strong params usage
  end
end
