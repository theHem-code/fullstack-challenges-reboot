require_relative 'repository'
require_relative 'view'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    posts = @repository.all
    @view.display_posts(posts)
  end

  def create
    new_path = @view.ask_for("path")
    url = "https://dev.to/#{new_path}"
    doc = Nokogiri::HTML(open(url).read)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n\n")
    author = doc.search(".crayons-article__subheader a").text.strip
    new_post = Post.new(path: new_path, title: title, content: content, author: author)
    @repository.add(new_post)
    list
  end

  def show
    list
    index = @view.ask_for("index")
    post = @repository.find(index.to_i - 1)
    @view.display_post(post)
  end

  def mark_as_read
    list
    index = @view.ask_for("index")
    @repository.mark_as_read(index.to_i - 1)
    list
  end
end
