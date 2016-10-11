class SessionsController < ApplicationController
  def create
    conn = Faraday.new("https://www.reddit.com/api/v1/access_token")
    conn.basic_auth(Figaro.env.reddit_id,Figaro.env.reddit_secret)
    oauth_repsonse = conn.post('https://www.reddit.com/api/v1/access_token', grant_type: "authorization_code", code: "#{params[:code]}", redirect_uri: 'http://0.0.0.0:3000/auth/reddit/callback')
    oauth = JSON.parse(oauth_repsonse.body)
    token = oauth["access_token"]
    conn_2 = Faraday.new("https://oauth.reddit.com/api/v1/me.json")
    conn_2.headers["Authorization"] = "bearer #{token}"
    user_info_response = conn_2.get
    user_info = JSON.parse(user_info_response.body)
    require "pry"; binding.pry
    user = User.find_or_create_by(username: user_info["name"])
    user.token = token
    user.refresh_token = oauth["refresh_token"]
    user.save
    conn_3 = Faraday.new("https://oauth.reddit.com/subreddits/mine/subscriber")
    conn_3.headers["Authorization"] = "bearer #{token}"
    subreddit_data = conn_3.get
    subreddits = JSON.parse(subreddit_data.body)
    redirect_to "/"
  end
end
