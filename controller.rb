
require_relative 'view'
require_relative 'models'
require 'sqlite3'
$db = SQLite3::Database.open('flash_cards.db')

class Controller
  attr_reader :view, :flashcard

  def initialize
    @view=View.new
  end

  def identify_length_of_db
    sql_all_statement = "SELECT * FROM flashcards"
    all_result = $db.execute(sql_all_statement)
    num_of_rows_in_db = all_result.length
    @max_rand_num = num_of_rows_in_db + 4
  end

  def random_id
    identify_length_of_db
    rand_id_no = rand(4..@max_rand_num)
    select_flashcard(rand_id_no)
  end

  def select_flashcard(rand_id_no)
    sql_statement = "SELECT question, answer FROM flashcards WHERE id = #{rand_id_no}"
    sql_result = $db.execute(sql_statement)
    flat_array_result = sql_result.flatten!
    question, answer = flat_array_result
    create_flashcard_object(question, answer)
  end

  def create_flashcard_object(question,answer)
    @flashcard = Flashcard.new(question,answer)
    view.display_question(flashcard)
  end

  def check_answer(user_input)
    if load_answer == user_input
      view.correct
    else
      view.incorrect
    end
  end

  def load_answer
    flashcard.answer
  end

  def get_flashcard_properties
    question=get_question
    answer=get_answer
    add_flashcard(question, answer)
  end

  def get_question
    view.question_prompt
    gets.chomp
  end

  def get_answer
    view.answer_prompt
    gets.chomp
  end

  def add_flashcard(question, answer)
    insert_sql_statement = "INSERT INTO flashcards (question, answer, created_at, updated_at) VALUES ('#{question}', '#{answer}', DATETIME('now'), DATETIME('now'));"
    $db.execute(insert_sql_statement)
  end

  def exit_message
    view.exit_message
  end
end
