require 'rails_helper'

describe "Subreddit show page" do
  it "shows the posts on a subreddit" do
    user = create_user_with_real_token
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }

    visit subreddit_path("APICurious")

    expect(page).to have_content("APIs ??? How to they work?")
    expect(page).to have_content("Testing to see upvotes appear in karma api endpoint")
    expect(page).to have_content("Bone Zone")
  end
end
