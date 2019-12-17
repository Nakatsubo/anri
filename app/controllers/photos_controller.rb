class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    if params[:photo].present?
      @photo = Photo.new(photo_params)
      @photo_uri = set_uri(@photo.photo.blob.key)
      @photo.user_id = current_user.id
      @labels = AnriGoogleCloudVision.new(@photo_uri).set_labels
      if @photo.save
        render 'components/posts/tweets/index', photo_uri: @photo_uri, label: @set_labels
      else
        render 'components/posts/photos/error'
      end
    else
      render 'components/posts/photos/error'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
