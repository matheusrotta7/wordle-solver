require '/home/matheus/RubymineProjects/wordle-solver/utils.rb'

class WordleEngine
  

  def initialize
    # utils_inst = Utils.new
    @game_word = Utils.pick_random_word_from_file
    puts "the word of the game is " + @game_word
  end

  def answer_guess(guess)

  end
end
