# create a method that populates the database with true or false Qs and As
require 'sqlite3'
$db = SQLite3::Database.open('flash_cards.db')


def populate_db(fc_question, fc_answer)
  $db.execute("INSERT INTO flashcards
  (question, answer, created_at, updated_at)
  VALUES
  ('#{fc_question}', '#{fc_answer}', DATETIME('now'), DATETIME('now'));")
end


populate_db('Array#each method in Ruby iterates through an array.', true)
populate_db('A method can end with a question mark: (method_name?).', true)
populate_db('i_am_a_class_name is the correct way to name a class.', false)
populate_db('Array#frozen? checks if the temperature of the array is below 0.', false)
populate_db('Array#at(index) returns the element at index.', true)
populate_db('Hash["a", 100, "b", 200] is one possible way of creating a new Hash object.', true)
populate_db('Arrays and Hashes both have a #length method.', true)
populate_db('The enumerable method #drop(number) will start to drop beats when called', true)
