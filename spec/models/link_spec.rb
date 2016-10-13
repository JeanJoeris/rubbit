require 'rails_helper'

describe Link, type: :model do
  it "has an title, author, url, subreddit and upvote score" do
    link = Link.new({ title: "This is a test", url: "https://foo.com", author: "test", score: 2 })

    expect(link.title).to eq("This is a test")
    expect(link.url).to eq("https://foo.com")
    expect(link.author).to eq("test")
    expect(link.score).to eq(2)
  end
end
