class RedditOAUTHService

  def self.get_tokens(code)
    oauth_response = access_conn.post('/api/v1/access_token',
                                      grant_type: "authorization_code",
                                      code: code,
                                      redirect_uri: 'http://0.0.0.0:3000/auth/reddit/callback')

    oauth = JSON.parse(oauth_response.body, symbolize_names: true)
    # require "pry"; binding.pry
    { access_token: oauth[:access_token], refresh_token: oauth[:refresh_token] }
  end


  def self.refresh_token(user)
    response = access_conn.post("/api/v1/access_token",
                                grant_type: "refresh_token",
                                refresh_token: user.refresh_token)

    response_data = JSON.parse(response.body, symbolize_names: true)
    user.update_attribute(:token, response_data[:access_token])
  end


  private
      def self.access_conn
        conn = Faraday.new("https://www.reddit.com")
        conn.basic_auth(ENV["reddit_id"], ENV["reddit_secret"])
        conn
      end
end
