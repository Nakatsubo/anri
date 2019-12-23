class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic
  before_action :set_client

  def set_uri(data)
    'https://anri-development.s3-ap-northeast-1.amazonaws.com/' + data
  end

  def set_text(text, hushtag)
    text + " " + hushtag
  end

  def set_retweet_text(mention, text, hushtag)
    mention + " " + text + " " + hushtag
  end

  def set_tweet(tweet, result, current_user, photo)
    tweet.endemic = result.id
    tweet.user_id = current_user.id
    tweet.photo_id = photo.id
  end

  private

  def set_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret = Rails.application.credentials.twitter[:api_secret_key]
      config.access_token = $access_token
      config.access_token_secret = $access_token_secret
    end
  end

  def basic
    if Rails.env == 'production'
      authenticate_or_request_with_http_basic do |name, password|
        name == Rails.application.credentials.basic[:basic_auth_name] && password == Rails.application.credentials.basic[:basic_auth_password]
      end
    end
  end
end
