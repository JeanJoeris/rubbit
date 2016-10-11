class RedditService
  def self.refresh_token(user)
    conn = Faraday.new("https://www.reddit.com/api/v1/access_token")
    conn.basic_auth(ENV["reddit_id"], ENV["reddit_secret"])
    response = conn.post("https://www.reddit.com/api/v1/access_token", grant_type: "refresh_token", refresh_token: user.refresh_token)
    response_data = JSON.parse(response.body)
    user.update_attribute(:token, response_data["access_token"])
  end

  def self.user_data(user)
    conn = Faraday.new("https://oauth.reddit.com/api/v1/me.json")
    conn.headers["Authorization"] = "bearer #{user.token}"
    JSON.parse(conn.get.body)
  end

  def self.subreddits(user)
    conn = Faraday.new("https://oauth.reddit.com/subreddits/mine/subscriber?limit=100")
    conn.headers["Authorization"] = "bearer #{user.token}"
    subreddits = JSON.parse(conn.get.body)
    subreddits["data"]["children"]
  end

  # private
  #     def conn
  #       Faraday.new("https://oauth....")
end
