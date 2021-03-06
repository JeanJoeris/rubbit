require 'rails_helper'

describe "Reddit API service", :type => :feature do
  it "finds basic user info" do
    user = create_user_with_real_token
    user_data = RedditService.user_data(user)

    expect(user_data[:name]).to eq("api_curious_test")
    expect(user_data[:link_karma]).to eq(3)
    expect(user_data[:comment_karma]).to eq(0)
  end

  it "finds user's subreddits" do
    user = create_user_with_real_token
    subreddits = RedditService.subreddits(user)
    expect(subreddits.count).to eq(15)
    expect(subreddits.first[:data][:display_name]).to eq("gadgets")
  end

  it "finds a subreddit by name" do
    subreddit = RedditService.subreddit_by_name("APICurious")
    expect(subreddit[:data][:display_name]).to eq("APICurious")
  end

  xit "finds user's karma" do
    user = create_user_with_real_token
    karma = RedditService.karma(user)
    expect(karma[:link_karma]).to eq(3)
    expect(karma[:comment_karma]).to eq(0)
  end

  it "finds a subreddits top posts" do
    posts = RedditService.top_posts("/r/APICurious/")

    expect(posts.count).to eq(3)
    expect(posts.first[:data][:title]).to eq("APIs ??? How to they work?")
  end

  it "finds a posts comments" do
    raw_post = RedditService.top_posts("/r/APICurious/").first
    post = Post.new(raw_post[:data])
    comments = RedditService.comments(post)

    expect(comments.count).to eq(2)
    expect(comments.first[:data][:body]).to eq("APIs for life!")
  end
end
