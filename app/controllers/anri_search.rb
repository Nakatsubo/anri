class AnriSearch
  attr_accessor :query

  def initialize(client, query)
    @client = set_client
    @query = query
  end

  def search
    set_query = @query
    since_id = nil
    # 作業はここから
  end
end