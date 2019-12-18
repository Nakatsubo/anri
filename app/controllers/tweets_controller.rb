class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(show create destroy)
  before_action :set_tweets, only: %i(show destroy)

  def create
    if tweet_params.present?
      @tweet = Tweet.new(tweet_params)
      @photo = Photo.recent(current_user)
      @photo_uri = set_uri(@photo.photo.blob.key)
      if @tweet.text.present?
        @set_tweet = set_text(@tweet.text, @tweet.hushtag)
        @result = AnriTwitter.new(@set_tweet.to_s, @photo_uri.to_s).tweet
        set_tweet(@tweet, @result, current_user, @photo)
        if @tweet.save
          render 'components/posts/posts/index', tweet: @tweet, photo_uri: @photo_uri
        else
          render 'components/posts/posts/error'
        end
      else
        render 'components/posts/posts/error'
      end
    else
      render 'components/posts/posts/error'
    end
  end

  def show
    @photo = Photo.new
    @tweet = Tweet.new
    @retweet = Retweet.new
    @client = set_client
    @photo_uri = set_uri(@this_tweet.photo.photo.blob.key)
    @reply_labels = AnriNatto.new(@client).set_reply_labels
  end

  def destroy
    @set_tweet = set_client
    if @set_tweet.destroy_tweet(@this_tweet.endemic)
      if @this_tweet.destroy
        redirect_to user_path(current_user.name)
      else
        render :create
      end
    else
      render :create
    end
  end

  private

  def set_tweets
    @this_tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text, :hushtag)
  end
end
