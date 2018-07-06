class PostsView
  def display(posts)
    puts "-" * 50
    puts "List of Posts"
    posts.each do |post|
      puts "#{post.id}. Votes: #{post.votes} | #{post.title} (#{post.url})"
    end
    puts "-" * 50
  end

  def ask_post_info
    puts "Post title>"
    title = gets.chomp
    puts "Post URL:"
    url = gets.chomp
    return {title: title, url: url}
  end

  def ask_post_id
    puts "What's the post id?"
    return gets.chomp.to_i
  end

  def show_post_not_find
    puts "***** Post not find! *****"
  end
end
