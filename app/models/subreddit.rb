class Subreddit
  def initialize(subreddit_data)
    @subreddit_data = subreddit_data
  end

  def self.by_user(user)
    RedditService.subreddits(user).map do |raw_subreddit|
      Subreddit.new(raw_subreddit["data"])
    end
  end

  def top_posts
    RedditService.top_posts(url)
  end

  def display_name
    subreddit_data["display_name"]
  end

  def url
    subreddit_data["url"]
  end

  private
      attr_reader :subreddit_data
end
