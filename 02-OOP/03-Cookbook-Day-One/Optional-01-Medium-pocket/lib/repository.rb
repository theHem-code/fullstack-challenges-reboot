require 'csv'
require_relative 'post'

class Repository
  def initialize(csv_path)
    @posts = []
    @csv_path = csv_path
    load_csv
  end

  def all
    @posts
  end

  def add(post)
    @posts << post
    save_csv
  end

  def find(index)
    @posts[index]
  end

  def mark_as_read(index)
    @posts[index].read!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path) do |row|
      @posts << Post.new(
        path: row[0],
        title: row[1],
        content: row[2],
        author: row[3],
        read: row[4]
      )
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      @posts.each do |post|
        csv << [post.path, post.title, post.content, post.author, post.read]
      end
    end
  end
end
