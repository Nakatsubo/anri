class AnriSearch
  attr_accessor :query

  def initialize(client, query)
    @client = client
    @query = query
  end

  def search
    set_query = @query
    since_id = nil
    @result_tweets = @client.search(query, count: 5, result_type: 'recent',  exclude: 'retweets', since_id: since_id)
    @result_tweets
  end
end