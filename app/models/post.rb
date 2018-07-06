class Post
  attr_accessor :title, :url, :votes
  attr_reader :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
  end

  def self.all
    DB.results_as_hash = true
    rows = DB.execute("SELECT * FROM posts")
    posts = []
    rows.each do |row|
      posts << Post.new(id: row['id'], title: row['title'], url: row['url'], votes: row['votes'])
    end
    return posts
  end

  def self.find(id)
    DB.results_as_hash = true
    row = DB.execute('SELECT * FROM posts WHERE id=?', id).first
    if row.nil?
      return nil
    else
      Post.new(id: row['id'], title: row['title'], url: row['url'], votes: row['votes'])
    end
  end

  def save
    @id.nil? ? insert : update
  end

  def destroy
    DB.execute('DELETE FROM posts WHERE id=?', @id)
  end

  private

  def insert
    DB.execute('INSERT INTO posts (title, url, votes) VALUES (?,?,?)', @title, @url, @votes)
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute('UPDATE posts SET title=?, url=?, votes=? WHERE id=?', @title, @url, @votes, @id)
  end


end