class AnriTwitter
  require 'twitter'
  require 'open-uri'

  attr_accessor :tweet, :image

  def initialize(tweet, photo_uri)
    @tweet = tweet
    @image = photo_uri
  end

  def set_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret = Rails.application.credentials.twitter[:api_secret_key]
      config.access_token = $access_token
      config.access_token_secret = $access_token_secret
    end
  end

  def tweet
    set_client
    open(@image) do |tmp|
      @client.update_with_media(@tweet, tmp)
    end
  end
end
