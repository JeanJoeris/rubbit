class PostsController < ApplicationController
  def show
    # @post = Subreddit.by_name(params[:subreddit_name]).top_posts.first
    @post = Post.find(post_params)
  end

  private
      def post_params
        params.permit(:id, :post_name, :subreddit_name)
      end
end
