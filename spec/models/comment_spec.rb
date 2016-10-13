require 'rails_helper'

describe Comment, type: :model do
  it "has an body, author and score" do
    comment = Comment.new({body: "This is a test", author: "test", score: 2})
    expect(comment.body).to eq("This is a test")
    expect(comment.author).to eq("test")
    expect(comment.score).to eq(2)
  end

  it "has an children" do
    post = Post.find({subreddit_name: "APICurious", id: "576c47", post_name: "apis_how_to_they_work"})
    comment = post.comments.first

    expect(comment.children.count).to eq(2)
    expect(comment.children.first.class).to eq(Comment)
    expect(comment.children.first.body).to eq("Who is this Jason they keep talking about?")
  end
end
