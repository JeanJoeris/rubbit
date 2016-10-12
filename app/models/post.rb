class Post
  def initialize(post_data)
    @data = post_data
  end

  def comments
    RedditService.comments(self).map do |raw_comment|
      Comment.new(raw_comment[:data])
    end
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
