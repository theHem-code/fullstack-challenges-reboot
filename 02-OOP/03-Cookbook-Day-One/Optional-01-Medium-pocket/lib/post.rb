class Post
  attr_reader :title, :content, :author, :path, :read

  def initialize(attributes = {})
    @path = attributes[:path]
    @title = attributes[:title]
    @content = attributes[:content]
    @author = attributes[:author]
    @read = attributes[:read] || false
  end

  def read!
    @read = true
  end
end
