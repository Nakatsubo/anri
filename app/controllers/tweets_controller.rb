class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    if params[:tweet][:text].present?
      @tweet = Tweet.new(tweet_params)
      @photo = Photo.recent(current_user)
      @tweet.user_id = current_user.id
      @tweet.photo_id = @photo.id
      if @tweet.save
        render 'components/posts/posts_index', local: { tweet: @tweet }
      end
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
