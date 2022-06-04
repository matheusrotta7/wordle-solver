class EngineAnswer
  attr_accessor :color_array, :player_guess

  def initialize(color_array, player_guess)
    @color_array = color_array
    @player_guess = player_guess
  end
end
