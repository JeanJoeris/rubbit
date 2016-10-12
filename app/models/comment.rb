class Comment
  def initialize(data)
    @data = data
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

  private
      attr_reader :data
end
