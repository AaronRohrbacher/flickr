class CommentsController < ApplicationController
  def new
    @user = current_user
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @photo = Photo.find(params[:photo_id])

    if @comment.save
      flash[:notice] = "comment successfully added!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :photo_id, :user_id) ## Rails 4 strong params usage
  end
end
