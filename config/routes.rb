Rails.application.routes.draw do
  root "home#index"
  get '/auth/reddit/callback',                      to: "sessions#create"
  get '/logout',                                    to: "sessions#destroy"
  get '/subreddits',                                to: "subreddits#index"
  get '/r/:subreddit_name/comments/:id/:post_name', to: "posts#show", as: "post"
  get '/r/:subreddit_name',                         to: "subreddits#show", as: "subreddit"
end
