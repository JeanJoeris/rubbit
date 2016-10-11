require 'rails_helper'

describe "Reddit API service", :type => :feature do
  it "refreshes a user's token" do
    # note - this test requires that you have a user that has already authorized the app
    # and recieved a refresh token which is set in application.yml
    user = create(:user)
    old_token = user.token
    RedditService.refresh_token(user)

    expect(user.token).to be_truthy
    expect(user.token).to_not eq(old_token)
    expect(user.token.length).to be > 8
  end

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
    expect(subreddits.count).to eq(49)
    expect(subreddits.first["data"]["display_name"]).to eq("gadgets")
  end
end
