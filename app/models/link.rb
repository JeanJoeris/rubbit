class Link
  def initialize(link_data)
    @data = link_data
  end

  def title
    data[:title]
  end

  def author
    data[:author]
  end

  def url
    data[:url]
  end

  def score
    data[:score]
  end

  def permalink
    data[:permalink]
  end

  def thumbnail
    data[:thumbnail]
  end

  def comment_number
    data[:num_comments]
  end

  def is_self
    data[:is_self]
  end

  private
      attr_reader :data
end
