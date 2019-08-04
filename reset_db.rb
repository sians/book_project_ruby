require "sqlite3"

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, "db/books.db"))

db.execute('DROP TABLE IF EXISTS `books`;')
db.execute('DROP TABLE IF EXISTS `posts`;')
create_statement = "
CREATE TABLE `books` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `title` TEXT,
  `author` TEXT,
  `pages`  INTEGER,
  `year_published`  INTEGER,
  `read`  INTEGER,
  `date_read`  INTEGER
);"
db.execute(create_statement)
