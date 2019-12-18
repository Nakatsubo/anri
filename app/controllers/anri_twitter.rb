class AnriTwitter
  require 'twitter'
  require 'open-uri'

  attr_accessor :tweet, :photo_uri, :client

  def initialize(tweet, photo_uri, client)
    @tweet = tweet
    @image = photo_uri
    @client = client
  end

  def tweet
    open(@image) do |tmp|
      @client.update_with_media(@tweet, tmp)
    end
  end
end
