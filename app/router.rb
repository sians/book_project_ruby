class Router
  def initialize
    @books_controller = BooksController.new
    @running = true
  end

  def run
    print_welcome
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
      break if @running == false
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @books_controller.index
    when 2 then @books_controller.create
    when 3 then @books_controller.update
    when 4 then @books_controller.destroy
    when 5 then @running = false
    end
  end

  def actions
    [
      "List all books",
      "Add a book",
      "Edit a book's details",
      "Delete a book",
      "Exit program"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "--------------------------"
    puts "Welcome to the Book Index!"
    puts "--------------------------"
  end
end
