class RetweetsController < ApplicationController
  before_action :authenticate_user!, only: %i(create)

  def create
    if retweet_params.present?
      @retweet = Tweet.new(retweet_params)
      @retweet.user_id = current_user.id
      @client = set_client
      @set_retweet = set_text(@retweet.text, @retweet.hushtag)
      @result = AnriRetweet.new(@client, @retweet.endemic, @set_retweet).reply
      if @retweet.save
        render 'components/posts/retweets/posts_index'
      else
        render 'components/posts/retweets/error'
      end
    else
      render 'components/posts/retweets/error'
    end
  end

  private

  def retweet_params
    params.require(:retweet).permit(:photo_id, :endemic, :text, :hushtag)
  end
end
