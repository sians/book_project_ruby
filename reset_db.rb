require "sqlite3"

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, "db/books.db"))

db.execute('DROP TABLE IF EXISTS `books`;')
create_statement = "
CREATE TABLE `books` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `title` TEXT,
  `author` TEXT,
  `pages`  INTEGER,
  `year_published`  INTEGER
);"
db.execute(create_statement)
