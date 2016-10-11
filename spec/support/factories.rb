FactoryGirl.define do
  factory :user do
    username "api_curious_test"
    token "placeholder_token"
    refresh_token ENV["test_refresh_token"]
  end
end
