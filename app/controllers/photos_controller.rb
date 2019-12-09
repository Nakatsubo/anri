class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      # flash は開発用なので本番環境では削除
      flash[:notice] = "success"
      redirect_to user_path(current_user.name)
    else
      # flash は開発用なので本番環境では削除
      flash[:notice] = "failure"
      redirect_to user_path(current_user.name)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
