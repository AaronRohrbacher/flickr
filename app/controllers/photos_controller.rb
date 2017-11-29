class PhotosController < ApplicationController

  def new
    @user = current_user
    @photo = @user.photos.new
  end

  def create
    @photo = photo.new(photo_params)
    if @photo.save
      flash[:notice] = "photo successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @photo = photo.find(params[:id])
  end

  def edit
    @photo = photo.find(params[:id])
  end

  def update
    @photo = photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "photo successfully updated!"
      redirect_to  photo_path
    else
      render :edit
    end
  end

  def destroy
    @photo = photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "photo successfully deleted!"
    redirect_to root_path
  end

  def upvote
    @photo = photo.find(params[:id])
    @photo.upvote_by current_user
    @photos = photo.all
    redirect_to photo_path
  end

  def downvote
    @photo = photo.find(params[:id])
    @photo.downvote_by current_user
    @photos = photo.all
    redirect_to photo_path
  end

  def tag(thing)
    @photo.tag_list.add(thing)
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :user_id) ## Rails 4 strong params usage
  end
end
