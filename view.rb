

class View

  def display_question(flashcard)
    puts " "
    puts flashcard.question
  end

  def correct
    puts ":-)"
  end

  def incorrect
    puts ":'("
  end

  def question_prompt
    puts " "
    puts "Please enter a question"
  end

  def answer_prompt
    puts " "
    puts "Please enter the answer"
  end

  def exit_message
    puts "Goodbye for now ;)"
  end


end

