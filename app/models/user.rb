class User < ApplicationRecord
  def karma
    data = RedditService.user_data(self)
    data[:link_karma] + data[:comment_karma]
  end
end
