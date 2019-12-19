class AnriNatto
  attr_accessor :client

  def initialize(client)
    @client = client
  end

  def mention_time_line
    @listTimeline = ""
    client.mentions_timeline.each do |tweet|
      @listTimeline << tweet.text
    end
    @listTimeline
  end

  def format_txt(txt)
    txt.gsub(/[!"#\\$%%\&()*+,-.\/:;<=>?@\[\]^_`{|}~]/, "")
  end

  def natto
    mention_time_line
    txt = @listTimeline
    format_txt(txt)
    natto = Natto::MeCab.new
    @surfaces = []
    natto.parse(txt) do |n|
      @surfaces << n.surface
    end
    @surfaces
  end

  def set_words
    natto
    my_name = @client.user.name
    my_nickname = @client.user.screen_name
    # forbidded words
    forbid_words = %w[http https com co jp my_name my_nickname , ！ @ \n]
    @surfaces = @surfaces.reject { |word| forbid_words.include?(word) }.reject(&:empty?)
    words = @surfaces.group_by(&:itself).map { |k, v| [k, v.size] }.sort_by {|k, v| -v }
    words = words.map { |k, v| k }
    @often_used_five_words = words.first(5)
    @often_used_five_words
  end

  def set_reply_labels
    set_words
    @labels = ""
    @often_used_five_words.each do |label|
      @labels << "#" + label + " "
    end
    @labels
  end
end
