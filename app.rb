#user gets a flash card
#question on flashcard gets displayed
#user input T/F
#user input check againest flashcard answer
#result displayed


require_relative 'controller'

class App
  attr_reader :controller

  def initialize
    @controller= Controller.new
    run
  end

  def run
    controller.select_flashcard
    puts "t or f?"
    user_input=gets.chomp
    controller.check_answer(user_input)
    run
  end


end

App.new








