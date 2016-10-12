require 'rails_helper'

describe "Reddit API service", :type => :feature do
  it "finds basic user info" do
    user = create_user_with_real_token
    user_data = RedditService.user_data(user)

    expect(user_data["name"]).to eq("api_curious_test")
    expect(user_data["link_karma"]).to eq(1)
    expect(user_data["comment_karma"]).to eq(0)
  end

  it "finds user's subreddits" do
    user = create_user_with_real_token
    subreddits = RedditService.subreddits(user)
    expect(subreddits.count).to eq(15)
    expect(subreddits.first["data"]["display_name"]).to eq("gadgets")
  end

  xit "finds user's karma" do
    user = create_user_with_real_token
    karma = RedditService.karma(user)
    expect(karma["link_karma"]).to eq(1)
    expect(karma["comment_karma"]).to eq(0)
  end
end
