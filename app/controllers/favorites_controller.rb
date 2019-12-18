class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i(create destroy)

  def create
    @tweet = Tweet.find(params[:format])
    @favorite = Favorite.new(tweet_id: @tweet.id, status: @tweet.endemic)
    @set_client = set_client
    @set_client.favorite(@tweet.endemic)
    if @favorite.save
      @this_tweet = @tweet
      render 'components/posts/favorites/index', this_tweet: @this_tweet
    else
      render 'components/posts/favorites/index'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @favorite = Favorite.find_by(tweet_id: params[:id])
    @set_client = set_client
    @set_client.unfavorite(@tweet.endemic)
    if @favorite.destroy
      @this_tweet = @tweet
      render 'components/posts/favorites/index', this_tweet: @this_tweet
    else
      render 'components/posts/favorites/index'
    end
  end
end
