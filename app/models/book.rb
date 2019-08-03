require 'pry-byebug'

class Book
  attr_accessor :id
  attr_reader :title, :author, :pages, :year_published
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @author = attributes[:author]
    @pages = attributes[:pages]
    @year_published = attributes[:year_published]
  end

  def self.all
    # DB.results_as_hash = true
    results = DB.execute("SELECT * FROM books")
    results.map { |result| Book.new(id: result[0], title: result[1], author: result[2], pages: result[3], year_published: result[4])}
  end

  def self.find(id)
    # DB.results_as_hash = true
    result = DB.execute("SELECT * FROM books WHERE books.id = ?", id)
    result.empty? ? nil : Book.new(id: result[0], title: result[1], author: result[2], pages: result[3], year_published: result[4])
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO books (title, author, pages, year_published) VALUES (?, ?, ?, ?)", @title, @author, @pages, @year_published)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE books SET title = ?, author = ?, pages = ?, year_published = ? WHERE id = ?", @title, @author, @pages, @year_published, @id)
    end
  end

  def destroy
    DB.execute("DELETE FROM books WHERE id = #{@id}")
  end
end
