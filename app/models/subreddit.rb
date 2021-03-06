class Subreddit
  def initialize(subreddit_data)
    @subreddit_data = subreddit_data
  end

  def self.by_user(user)
    RedditService.subreddits(user).map do |raw_subreddit|
      Subreddit.new(raw_subreddit[:data])
    end
  end

  def self.by_name(name)
    Subreddit.new(RedditService.subreddit_by_name(name)[:data])
  end

  def links
    RedditService.top_posts(url).map do |raw_post|
      Link.new(raw_post[:data])
    end
  end

  def display_name
    subreddit_data[:display_name]
  end

  def url
    subreddit_data[:url]
  end

  private
      attr_reader :subreddit_data
end
