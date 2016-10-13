class Post
  def initialize(post_data)
    @data = post_data
  end

  def self.find(post_data)
    raw_post = RedditService.find_post(post_data)
    Post.new(raw_post)
  end

  def comments
    data[1][:data][:children].map do |raw_comment|
      Comment.new(raw_comment[:data])
    end
  end

  def link
    Link.new(data.first[:data][:children].first[:data])
  end

  def title
    data[:title]
  end

  def author
    data[:author]
  end

  def url
    data[:url]
  end

  def score
    data[:score]
  end

  def permalink
    data[:permalink]
  end

  private
      attr_reader :data
end
