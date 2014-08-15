
require_relative 'view'
require_relative 'models'

class Controller
  attr_reader :view, :flashcard

  def initialize
    @view=View.new
  end

  def select_flashcard
    #select flash card from data base
    create_flashcard_object("Does this work?","t")
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
    #Shout out to amelia
  end

  def exit_message
    view.exit_message
  end




end
