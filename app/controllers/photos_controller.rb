class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def new
  end
  def create
    
  end
end
