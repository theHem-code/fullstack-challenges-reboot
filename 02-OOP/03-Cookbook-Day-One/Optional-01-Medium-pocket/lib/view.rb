class View
  def display_posts(posts)
    posts.each_with_index do |post, index|
      status = post.read ? "[ X ]" : "[   ]"
      puts "#{index + 1}. #{status} #{post.title} (#{post.author})"
    end
  end

  def ask_for(stuff)
    puts "> #{stuff}?"
    return gets.chomp
  end

  def display_post(post)
    puts "TITLE: #{post.title}"
    puts post.content.to_s
    puts ""
    puts "AUTHOR: #{post.author}"
    puts "\n\n"
  end
end
