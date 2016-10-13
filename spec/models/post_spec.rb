require 'rails_helper'

describe Post, type: :model do
  it "has links" do
    post = Post.find({subreddit_name: "APICurious", id: "576c47", post_name: "apis_how_to_they_work"})
    link = post.link

    expect(link.title).to eq("APIs ??? How to they work?")
    expect(link.author).to eq("api_curious_test")
  end

  it "has comments" do
    post = Post.find({subreddit_name: "APICurious", id: "576c47", post_name: "apis_how_to_they_work"})
    comments = post.comments

    expect(comments.count).to eq(2)
    expect(comments.first.body).to eq("APIs for life!")
    expect(comments.last.body).to eq("Another top level comment")
  end
end
