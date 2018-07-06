class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    list_all_posts
  end

  def create
    #Ask post info
    post_info = @view.ask_post_info
    # Instanciate a new post
    post = Post.new(post_info)
    # save the post
    post.save
  end

  def update
    # list all posts
    list_all_posts
    # Ask post id
    id = @view.ask_post_id
    # Find the post by id
    post = Post.find(id)
    if post
      # Ask post info
      post_info = @view.ask_post_info
      # update post attributes
      post.title = post_info[:title]
      post.url = post_info[:url]
      # Save the post
      post.save
    else
      @view.show_post_not_find
    end
  end

  def destroy
    # list all posts
    list_all_posts
    # ask post id
    id = @view.ask_post_id
    # find post by id
    post = Post.find(id)
    if post
      # destroy post
      post.destroy
    else
      @view.show_post_not_find
    end
  end

  def upvote
    # list all posts
    list_all_posts
    # ask post id
    id = @view.ask_post_id
    # find post by id
    post = Post.find(id)
    if post
      # increment votes
      post.votes += 1
      # save post
      post.save
    else
      @view.show_post_not_find
    end
  end

  private

  def list_all_posts
    posts = Post.all
    @view.display(posts)
  end

end
