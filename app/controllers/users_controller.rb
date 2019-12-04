class UsersController < ApplicationController
  before_action :set_users, only: %i(show)

  def show
    
  end

  private

  def set_users
    @user = current_user
  end
end
