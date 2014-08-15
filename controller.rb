
require_relative 'view'
require_relative 'models'

class Controller
  attr_reader :view, :flashcard

  def initialize
    @view=View.new
  end

  def select_flashcard
    #select flash card from data base
    create_flashcard_object(1,"Does this work?","t")
  end

  def create_flashcard_object(id,question,answer)
    @flashcard = Flashcard.new(id,question,answer)
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




end
