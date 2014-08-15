
require_relative 'view'
require_relative 'models'
require 'sqlite3'
$db = SQLite3::Database.open('flash_cards.db')

class Controller
  attr_reader :view, :flashcard

  def initialize
    @view=View.new
  end

  def random_id
    rand_id_no = rand(19..30)
    select_flashcard(rand_id_no)
  end

  def select_flashcard(rand_id_no)
    sql_statement = "SELECT question, answer FROM flashcards WHERE id = #{rand_id_no}"
    sql_result = $db.execute(sql_statement)
    flat_array_result = sql_result.flatten!
    question, answer = flat_array_result
    create_flashcard_object(question, answer)
  end

  def create_flashcard_object(id,question,answer)
    @flashcard = Flashcard.new(id,question,answer)
    view.display_question(flashcard)
  end

  def check_answer(user_input)
    load_answer

  end


  def load_answer
    flashcard.answer
  end




end
