Rails.application.routes.draw do
  root "home#index"
  get '/auth/reddit/callback', to: "sessions#create"
  get '/subreddits', to: "subreddits#index"
  get '/r/:subreddit_name', to: "subreddits#show", as: "subreddit"
end
