require 'pry-byebug'

class BookView
  def list(books)
    puts "--------- B O O K S ---------"
    puts ""
    books.each { |book| puts "#{book.id}. #{book.title} -- #{book.author}"}
  end

  def no_books
    puts "You don't seem to have any books yet!"
    puts ""
    puts "[A]dd a book? Or back to the [m]enu?"
    gets.chomp.capitalize
  end

  def ask_for_book_details
    puts ""
    puts "What is the title of the book?"
    title = gets.chomp
    puts "What is the author's name?"
    author = gets.chomp
    puts "How many pages?"
    pages = gets.chomp.to_i
    puts "Year first published?"
    first_published = gets.chomp.to_i
    { title: title, author: author, pages: pages, first_published: first_published }
  end

  def edit_book_details(book)
    puts ""
    puts "---------------------------"
    puts "--------- E D I T ---------"
    puts "---------------------------"
    puts ""

    details = {}

    puts "Current title: #{book.title}"
    puts "New title: ([n]ext to leave the same)"
    action = gets.chomp
    details[:title] = action unless action.downcase == "n"

    puts "Current author: #{book.author}"
    puts "New author: ([n]ext to leave the same)"
    action = gets.chomp
    details[:author] = action unless action.downcase == "n"

    puts "Current number of pages: #{book.pages}"
    puts "New number of pages: ([n]ext to leave the same)"
    action = gets.chomp
    details[:pages] = action.to_i unless action.downcase == "n"

    puts "Current publish year: #{book.year_published}"
    puts "New publish year: ([n]ext to leave the same)"
    action = gets.chomp
    details[:year_published] = action.to_i unless action.downcase == "n"

    book.read? ? x = "yes" : x = "no"
    puts "Current read status: #{x}"
    puts "New read status (read=1, unread=0): ([n]ext to leave the same)"
    action = gets.chomp
    details[:read] = action.to_i unless action.downcase == "n"

    details
  end

  def view_book(book)
    puts "-------------------"
    puts "title:             #{book.title}"
    puts "author:            #{book.author}"
    puts "pages:             #{book.pages}"
    puts "first published:   #{book.year_published}"
    book.read? ? x = "yes" : x = "no"
    puts "read:              #{x}"
  end

  def ask_for_edit(book)
    puts "Would you like to edit the book #{book.title}? [Y]es / [N]o"
    gets.chomp
  end

  def ask_for_id(action)
    puts ""
    puts "What is the id of the book you would like to #{action}?"
    gets.chomp.to_i
  end

  def confirm_delete
    puts ""
    puts "Are you sure that you want to permanently delete this book? Press [y] to continue"
    gets.chomp
  end

  def delete_cancelled
    puts ""
    puts "The post won't be deleted yet!"
    puts ""
  end

end
