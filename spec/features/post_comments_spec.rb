require 'rails_helper'

describe "Post with comments" do
  it "shows the link and comments" do
    user = create_user_with_real_token
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }

    visit subreddit_path("APICurious")
    click_on "APIs ??? How to they work?"

    expect(page).to have_content("APIs ??? How to they work?")
    expect(page).to have_content("APIs for life!")
    expect(page).to have_content("Who is this Jason they keep talking about?")
  end
end
