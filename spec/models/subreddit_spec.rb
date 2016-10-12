require 'rails_helper'

describe Subreddit, type: :model do
  context "given an authenticated user" do
    it "finds all subreddits" do
      user = create_user_with_real_token
      subreddits = Subreddit.by_user(user)
      expect(subreddits.count).to eq(15)
      expect(subreddits.first.display_name).to eq("gadgets")
    end

    it "lists a subreddits top posts" do
      user = create_user_with_real_token
      subreddits = Subreddit.by_user(user)
      test_subreddit = subreddits.find { |s| s.display_name == "APICurious"}

      first_post = test_subreddit.top_posts.first
      expect(test_subreddit.post_count).to eq(3)
      expect(first_post.title).to eq("APIs ??? How to they work?")
    end
  end
end
