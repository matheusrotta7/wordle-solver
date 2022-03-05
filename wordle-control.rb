require '/home/matheus/RubymineProjects/wordle-solver/wordle-engine.rb'
require '/home/matheus/RubymineProjects/wordle-solver/wordle-cpu-player.rb'

class WordleControl

  def initialize
    puts "Inside control constructor"
    @player = WordlePlayer.new
    @engine = WordleEngine.new
  end

  def main
    puts "Hello World! Starting wordle game..."
    puts "Player has to guess the word in the first attempt"
    first_guess = @player.first_guess
    puts "Player's first guess was" + first_guess
    engine_response = @engine.answer_guess(first_guess)
    if engine_response.eql?("ggggg")
      puts "player has won! word was " + first_guess
    end

    for a in [1..5] do
      player_guess = @player.next_guess(engine_response)
      engine_response = @engine.answer_guess(player_guess)
      if engine_response.eql?("ggggg")
        puts "player has won! word was " + player_guess
      end
      puts engine_response
    end

  end
end

control = WordleControl.new
control.main
