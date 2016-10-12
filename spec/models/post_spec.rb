require 'rails_helper'

describe Post, type: :model do
  it "has an author, url, subreddit and upvote score" do
    post = Post.new({ data: { url: "https://foo.com", author: "test", score: 2 } })

    expect(post.url).to eq("https://foo.com")
    expect(post.author).to eq("test")
    expect(post.score).to eq(2)
  end
end
