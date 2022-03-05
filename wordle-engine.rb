require '/home/matheus/RubymineProjects/wordle-solver/utils.rb'

class WordleEngine
  

  def initialize
    # utils_inst = Utils.new
    @game_word = Utils.pick_random_word_from_file
    puts "the word of the game is " + @game_word
  end

  def answer_guess(guess)
    # guess is a five letter word
    # we have to compare with the original word and answer each letter separately
    answer_array = Array.new(5, 'u') # u is undefined
    i = 0
    for char in guess
      if (char.eql?(@game_word[i]))
        answer_array[i] = 'g' # green
      elsif (@game_word.include?(char))
        answer_array[i] = 'y' # yellow
      else
        answer_array[i] = 'w' # wrong
      end
      i += 1
    end
    return answer_array
  end
end
