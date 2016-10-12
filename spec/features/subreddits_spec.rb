require 'rails_helper'

RSpec.describe "Subreddits", type: :feature do
  it "shows a list of a user's subreddits" do
    user = create_user_with_real_token

    visit subreddits_path
save_and_open_page
    expect(page).to have_content("funny")
    expect(page).to have_content("aww")
  end
end
