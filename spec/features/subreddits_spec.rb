require 'rails_helper'

RSpec.describe "Subreddits", type: :feature do
  it "shows a list of a user's subreddits" do
    user = create(:user)

    visit subreddits_path

    expect(page).to have_content("Funny")
    expect(page).to have_content("Aww")
  end
end
