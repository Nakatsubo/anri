class HomesController < ApplicationController
  before_action :login_forbided, only: %i(index)

  def index
  end

  def about
  end

  def terms
  end

  def privacy
  end

  private

  def login_forbided
    redirect_to user_path(current_user.name) if current_user
  end
end
