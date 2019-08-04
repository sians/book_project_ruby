require 'pry-byebug'
# require_relative '../views/books_view.rb'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def index
    if Book.all.empty?
      create if @view.no_books == "A"
    else
      @view.list(Book.all)
    end
  end

  def show

  end

  def create
    book_details = @view.ask_for_book_details
    book = Book.new(book_details)
    book.save
  end

  def update
    index
    book = Book.find(@view.ask_for_id("update"))
  end

  def destroy
    index
    book = Book.find(@view.ask_for_id("delete"))
    @view.confirm_delete == "y" ? book.destroy : @view.delete_cancelled

  end
end
