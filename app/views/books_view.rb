class BooksView
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
