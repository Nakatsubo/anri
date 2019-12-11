class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    if params[:tweet][:text].present?
      @tweet = Tweet.new(tweet_params)
      @photo = Photo.recent(current_user)
      @photo_uri = set_uri(@photo.photo.blob.key)
      @result = AnriTwitter.new(@tweet.text.to_s, @photo_uri.to_s).tweet
      @tweet.endemic = @result.id
      @tweet.user_id = current_user.id
      @tweet.photo_id = @photo.id
      binding.pry
      if @tweet.save
        render 'components/posts/posts_index', local: { tweet: @tweet, photo_uri: @photo_uri }
      else
        render 'components/posts/posts_error'
      end
    else
      render 'components/posts/posts_error'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
