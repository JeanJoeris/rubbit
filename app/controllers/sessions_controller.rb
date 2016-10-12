class SessionsController < ApplicationController
  def create
    tokens = RedditOAUTHService.get_tokens(params[:code])

    user = RedditService.get_user(tokens)

    session[:user_id] = user.id

    redirect_to "/"
  end

  # def get_tokens
  #   conn = Faraday.new("https://www.reddit.com/api/v1/access_token")
  #   conn.basic_auth(Figaro.env.reddit_id,Figaro.env.reddit_secret)
  #   oauth_repsonse = conn.post('https://www.reddit.com/api/v1/access_token', grant_type: "authorization_code", code: "#{params[:code]}", redirect_uri: 'http://0.0.0.0:3000/auth/reddit/callback')
  #   oauth = JSON.parse(oauth_repsonse.body)
  #   { access_token: oauth["access_token"], refresh_token: oauth["refresh_token"] }
  # end

  # def get_user(tokens)
  #   conn = Faraday.new("https://oauth.reddit.com/api/v1/me.json")
  #   conn.headers["Authorization"] = "bearer #{tokens[:access_token]}"
  #   user_info = JSON.parse(conn.get.body)
  #   user = User.find_or_create_by(username: user_info["name"])
  #   user.token = tokens[:access_token]
  #   user.refresh_token = tokens[:refresh_token]
  #   user.save
  #   user
  # end
end

# conn_2 = Faraday.new("https://oauth.reddit.com/api/v1/me.json")
# conn_2.headers["Authorization"] = "bearer #{token}"
# user_info_response = conn_2.get
# user_info = JSON.parse(user_info_response.body)
# user = User.find_or_create_by(username: user_info["name"])
# user.token = token
# user.refresh_token = oauth["refresh_token"]
# user.save
# conn_3 = Faraday.new("https://oauth.reddit.com/subreddits/mine/subscriber")
# conn_3.headers["Authorization"] = "bearer #{token}"
# subreddit_data = conn_3.get
# subreddits = JSON.parse(subreddit_data.body)
# redirect_to "/"
