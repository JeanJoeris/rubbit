class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.by_user(current_user)
  end

  def show
    @subreddit = Subreddit.by_name(params[:subreddit_name])
  end
end
