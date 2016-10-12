require 'rails_helper'

describe Comment, type: :model do
  it "has an body, author and score" do
    # post = Post.new({ title: "This is a test", url: "https://foo.com", author: "test", score: 2 })
    comment = Comment.new({body: "This is a test", author: "test", score: 2})
    expect(comment.body).to eq("This is a test")
    expect(comment.author).to eq("test")
    expect(comment.score).to eq(2)
  end
end
