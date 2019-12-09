class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to user_path(current_user.name)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
