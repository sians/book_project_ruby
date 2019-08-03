require 'pry-byebug'
# require_relative '../views/books_view.rb'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def index
    @view.list(Book.all)
  end

  def create
    book_details = @view.ask_for_book_details
    book = Book.new(book_details)
    book.save
  end

  def update

  end

  def destroy

  end

end
