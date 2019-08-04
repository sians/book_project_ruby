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
    index
    book = Book.find(@view.ask_for_id("view"))
    @view.view_book(book)
    if @view.ask_for_edit(book).capitalize == "Y"
      updated_details = @view.edit_book_details(book)
      edit(book, updated_details)
    end
  end

  def create
    book_details = @view.ask_for_book_details
    book = Book.new(book_details)
    book.save
  end

  def edit(book, updated_details)
    binding.pry
    book.title = updated_details[:title] unless updated_details[:title].nil?
    book.author = updated_details[:author] unless updated_details[:author].nil?
    book.pages = updated_details[:pages] unless updated_details[:pages].nil?
    book.year_published = updated_details[:year_published] unless updated_details[:year_published].nil?
    book.read = updated_details[:read] unless updated_details[:read].nil?
    book.save
  end

  def update
    index
    book = Book.find(@view.ask_for_id("update"))
    updated_details = @view.edit_book_details(book)
    edit(book, updated_details)
  end

  def destroy
    index
    book = Book.find(@view.ask_for_id("delete"))
    @view.confirm_delete == "y" ? book.destroy : @view.delete_cancelled

  end
end
