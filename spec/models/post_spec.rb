require 'rails_helper'

describe Post, type: :model do
  it "has an title, author, url, subreddit and upvote score" do
    post = Post.new({ title: "This is a test", url: "https://foo.com", author: "test", score: 2 })

    expect(post.title).to eq("This is a test")
    expect(post.url).to eq("https://foo.com")
    expect(post.author).to eq("test")
    expect(post.score).to eq(2)
  end

  it "has comments" do
    raw_post = RedditService.top_posts("/r/APICurious/").first
    post = Post.new(raw_post[:data])
    comments = post.comments

    expect(comments.count).to eq(1)
    expect(comments.first.body).to eq("APIs for life!")
  end
end
