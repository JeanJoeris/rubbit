require 'rails_helper'

RSpec.describe "Subreddits", type: :feature do
  it "shows a list of a user's subreddits" do
    user = create_user_with_real_token
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }

    visit subreddits_path

    expect(page).to have_content("funny")
    expect(page).to have_content("aww")
  end
end
