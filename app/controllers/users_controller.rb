class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(show)

  def show
    @photo = Photo.new
    @tweet = Tweet.new
    @client = set_client
    # binding.pry
  end

end
