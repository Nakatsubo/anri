class ReplysController < ApplicationController
  before_action :authenticate_user!, only: %i(create destroy)

  def create
    @tweet = Tweet.find(params[:format])
    @reply = Reply.new(tweet_id: @tweet.id, status: @tweet.endemic)
    @set_client = set_client
    @set_client.retweet(@tweet.endemic)
    if @reply.save
      @this_tweet = @tweet
      render 'components/posts/replys/index', this_tweet: @this_tweet
    else
      render 'components/posts/replys/index'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @reply = Reply.find_by(tweet_id: params[:id])
    @set_client = set_client
    @set_client.unretweet(@tweet.endemic)
    if @reply.destroy
      @this_tweet = @tweet
      render 'components/posts/replys/index', this_tweet: @this_tweet
    else
      render 'components/posts/replys/index'
    end
  end
end
