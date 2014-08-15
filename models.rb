class Flashcard
  attr_reader :id, :question, :answer #leaving id for later 'add' feature
  def initialize(id, question, answer)#leaving id for later 'add' feature
    @id=id
    @question=question
    @answer=answer
  end

end



