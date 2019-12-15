class RetweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    
  end

  private

  def retweet_params
    params.require(:retweet).permit(:text)
  end
end
