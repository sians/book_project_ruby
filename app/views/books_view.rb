class BooksView
  def list(books)
    puts "--------- B O O K S ---------"
    puts ""
    books.each { |book| puts "#{book.id}. #{book.title} -- #{book.author}"}
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

end
