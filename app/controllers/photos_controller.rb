class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    if params[:photo].present?
      @photo = Photo.new(photo_params)
      @photo.user_id = current_user.id
      if @photo.save
        render 'components/posts/tweets_index'
      else
        render 'components/posts/photos_index'
      end
    else
      render 'components/posts/photos_index'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
