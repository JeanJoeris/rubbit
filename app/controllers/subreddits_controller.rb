class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.by_user(current_user)
  end
end
