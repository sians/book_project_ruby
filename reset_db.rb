require "sqlite3"

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, "db/books.db"))

db.execute('DROP TABLE IF EXISTS `books`;')
db.execute('DROP TABLE IF EXISTS `users`;')
create_books = "
CREATE TABLE `books` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `title` TEXT,
  `author` TEXT,
  `pages`  INTEGER,
  `year_published`  INTEGER,
  `read`  INTEGER,
  `date_read`  INTEGER
);"
create_users = "
CREATE TABLE `users` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` TEXT,
  `password` TEXT,
  `role` TEXT
);"
db.execute(create_books)
db.execute(create_users)
