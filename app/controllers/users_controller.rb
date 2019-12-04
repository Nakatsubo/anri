class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(show)

  def show
  end

end
