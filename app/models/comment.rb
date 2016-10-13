class Comment
  def initialize(data)
    @data = data
  end

  def children
    unless has_no_replies(data)
      data[:replies][:data][:children].map do |raw_reply|
        Comment.new(raw_reply[:data])
      end
    end
  end

  def body
    data[:body]
  end

  def author
    data[:author]
  end

  def score
    data[:score]
  end

  def to_partial_path
    'posts/comment'
  end

  private
      attr_reader :data

      def has_no_replies(data)
        data[:replies] == "" || data[:replies] == nil
      end
end
