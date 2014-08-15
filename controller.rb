
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
    @rand_id_no = rand(11) + 1
  end

  def select_flashcard
    random_id
    array_of_flashcard = $db.execute("SELECT question, answer FROM flashcards WHERE id = #{@random_id_no}")
    create_flashcard_object(1,"Does this work?","true")
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
