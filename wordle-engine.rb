require '/home/matheus/RubymineProjects/wordle-solver/utils.rb'
require '/home/matheus/RubymineProjects/wordle-solver/engine_answer.rb'

class WordleEngine
  

  def initialize
    # utils_inst = Utils.new
    @game_word = Utils.pick_random_word_from_file
    puts "the word of the game is " + @game_word
  end

  def assign_green_if_needed(color_array, player_guess, i)
    if @game_word.eql?(player_guess[i])
      color_array[i] = 'g'
    end
  end

  def assign_yellow_if_needed(color_array, player_guess, i)
    cur_letter = @game_word[i]
    for j in 0..4 do
      if player_guess[j].eql?(cur_letter)
        color_array[j] = 'y'
        break # only assign one yellow per game_word letter
      end
    end
  end

  def answer_guess(player_guess)
    # guess is a five letter word
    # we have to compare with the original word and answer each letter separately
    color_array = Array.new(5, 'w') # starts with wrong status and may be changed to yellow or green

    puts "Inside answer_guess method, about to enter loop"

    for i in 0..4 do
      puts "i" + i.to_s
      puts color_array.to_s
      if @game_word.eql?(player_guess[i])
        color_array[i] = 'g'
        next
      end
      assign_yellow_if_needed(color_array, player_guess, i)
    end

    engine_answer = EngineAnswer.new(color_array, player_guess)
    engine_answer
  end
end
