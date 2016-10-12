require 'rails_helper'

describe "Reddit OAUTH API service", :type => :feature do
  it "refreshes a user's token" do
    # note - this test requires that you have a user that has already authorized the app
    # and recieved a refresh token which is set in application.yml
    user = create(:user)
    old_token = user.token
    RedditOAUTHService.refresh_token(user)

    expect(user.token).to be_truthy
    expect(user.token).to_not eq(old_token)
    expect(user.token.length).to be > 8
  end
end
