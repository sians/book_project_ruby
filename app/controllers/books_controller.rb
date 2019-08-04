require 'pry-byebug'
# require_relative '../views/books_view.rb'

class BooksController
  def initialize
    @book_view = BookView.new
  end

  def index
    if Book.all.empty?
      create if @book_view.no_books == "A"
    else
      @book_view.list(Book.all)
    end
  end

  def show
    index
    book = Book.find(@book_view.ask_for_id("view"))
    @book_view.view_book(book)
    if @book_view.ask_for_edit(book).capitalize == "Y"
      updated_details = @book_view.edit_book_details(book)
      edit(book, updated_details)
    end
  end

  def create
    book_details = @book_view.ask_for_book_details
    book = Book.new(book_details)
    book.save
  end

  def edit(book, updated_details)
    book.title = updated_details[:title] unless updated_details[:title].nil?
    book.author = updated_details[:author] unless updated_details[:author].nil?
    book.pages = updated_details[:pages] unless updated_details[:pages].nil?
    book.year_published = updated_details[:year_published] unless updated_details[:year_published].nil?
    book.read = updated_details[:read] unless updated_details[:read].nil?
    book.save
  end

  def update
    index
    book = Book.find(@book_view.ask_for_id("update"))
    updated_details = @book_view.edit_book_details(book)
    edit(book, updated_details)
  end

  def destroy
    index
    book = Book.find(@book_view.ask_for_id("delete"))
    @book_view.confirm_delete == "y" ? book.destroy : @book_view.delete_cancelled

  end
end
