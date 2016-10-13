class RedditService
  def self.user_data(user)
    conn = Faraday.new("https://oauth.reddit.com/api/v1/me.json")
    conn.headers["Authorization"] = "bearer #{user.token}"
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  def self.subreddits(user)
    response = authorized_conn(user.token).get("/subreddits/mine/subscriber?limit=100")
    subreddits = JSON.parse(response.body, symbolize_names: true)
    subreddits[:data][:children]
  end

  def self.subreddit_by_name(name)
    response = Faraday.get("https://www.reddit.com/r/#{name}/about.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user(tokens)
    response = authorized_conn(tokens[:access_token]).get("/api/v1/me.json")
    user_info = JSON.parse(response.body, symbolize_names: true)
    user = User.find_or_create_by(username: user_info[:name])
    user.update_attributes(token: tokens[:access_token], refresh_token: tokens[:refresh_token])
    # user.token = tokens[:access_token]
    # user.refresh_token = tokens[:refresh_token]
    # user.save
    user
  end

  def self.top_posts(subreddit_uri)
    response = Faraday.get("https://www.reddit.com#{subreddit_uri}.json")
    posts = JSON.parse(response.body, symbolize_names: true)
    posts[:data][:children]
  end

  def self.comments(post)
    response = Faraday.get("https://www.reddit.com#{post.permalink}.json")
    comments = JSON.parse(response.body, symbolize_names: true)
    comments[1][:data][:children]
  end

  def self.karma(user)
    response = authorized_conn(user.token).get("/api/v1/me/karma")
  end

  private
      def self.authorized_conn(token)
        conn = Faraday.new("https://oauth.reddit.com")
        conn.headers["Authorization"] = "bearer #{token}"
        conn
      end
end
