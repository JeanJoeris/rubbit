class SubredditsController < ApplicationController
  def index
    @subreddits = RedditService.subreddits(current_user)
  end
end
