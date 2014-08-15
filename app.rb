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
    controller.random_id
    puts "t or f?"
    puts " "
    user_input=gets.chomp
    controller.check_answer(user_input)
    user_input=gets.chomp
    unless user_input=="exit"
      run
    end

  end


end

App.new








