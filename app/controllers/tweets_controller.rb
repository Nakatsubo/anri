class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    
  end
end
