class SubredditsController < ApplicationController
  def index
    # require "pry"; binding.pry
    @subreddits = RedditService.subreddits(current_user)
  end
end
