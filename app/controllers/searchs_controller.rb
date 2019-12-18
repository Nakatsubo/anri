class SearchsController < ApplicationController
  before_action :authenticate_user!, only: %i(index create)

  def index
    @client = set_client
  end

  def create
    
  end
end
