class SearchsController < ApplicationController
  before_action :authenticate_user!, only: %i(index create)

  def index
    @search = Search.new
  end

  def create
    if search_params.present?
      @search = Search.new(search_params)
      @client = set_client
      @result = AnriSearch.new(@client, @search.query).search
      if @result.present?
        # binding.pry
        render 'components/searchs/result', result: @result
      else
        render 'components/searchs/error'
      end
    else
      render 'components/searchs/error'
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
