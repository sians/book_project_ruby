require 'pry-byebug'

class Book
  attr_accessor :id, :title, :author, :pages, :year_published, :date_read
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @author = attributes[:author]
    @pages = attributes[:pages]
    @year_published = attributes[:year_published]
    @read = attributes[:read] || 0 #boolean
    @date_read = attributes[:date_read]
  end

  def read?
    @read == 1
  end

  def self.all
    # DB.results_as_hash = true
    results = DB.execute("SELECT * FROM books")
    results.map { |result| Book.new(id: result[0], title: result[1], author: result[2], pages: result[3], year_published: result[4], read: result[5], date_read: result[6]) }
  end

  def self.find(id)
    # DB.results_as_hash = true
    result = DB.execute("SELECT * FROM books WHERE books.id = ?", id)
    result.empty? ? nil : Book.new(id: result[0][0], title: result[0][1], author: result[0][2], pages: result[0][3], year_published: result[0][4], read: result[0][5], date_read: result[0][6])
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO books (title, author, pages, year_published, read, date_read) VALUES (?, ?, ?, ?, ?, ?)", @title, @author, @pages, @year_published, @read, @date_read)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE books SET title = ?, author = ?, pages = ?, year_published = ?, read = ?, date_read = ? WHERE id = ?", @title, @author, @pages, @year_published, @read, @date_read, @id)
    end
  end

  def destroy
    DB.execute("DELETE FROM books WHERE id = #{@id}")
  end
end
