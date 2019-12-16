class AnriRetweet
  attr_accessor :client, :endemic, :set_retweet

  def initialize(client, endemic, set_retweet)
    @client = client
    @endemic = endemic
    @set_retweet = set_retweet
  end

  def reply
    @set_client = @client.status(endemic)
    @reply = @client.update("#{@set_retweet}", options = {:in_reply_to_status_id => @set_client.id})
  end

end