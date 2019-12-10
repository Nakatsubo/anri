class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(show)

  def show
    @photo = Photo.new
    @tweet = Tweet.new
  end

end
