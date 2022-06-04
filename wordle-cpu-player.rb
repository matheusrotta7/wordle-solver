require 'set'

class WordlePlayer

  def initialize
    @wrong_letters = Set.new
  end

  def first_guess
    Utils.pick_random_word_from_file
  end

  def does_not_contain_eliminated_letter(word)
    word_arr = word.split('')
    word_arr.each { |char|
      if @wrong_letters.include?(char)
        return false
      end
    }
    true
  end

  def didnt_change_position_at_all(word, engine_response, i)
    word[i].eql?(engine_response.player_guess[i])
  end

  def count_number_of_given_letters(word, engine_response, i)
    result = 0
    cur_letter = engine_response.player_guess[i]
    for j in 0..4 do
      if engine_response.player_guess[j].eql?(cur_letter) and ['y', 'g'].include?(engine_response.color_array[j])
        result += 1
      end
    end
    result
  end

  def number_of_given_letter(word, letter)
    result = 0
    for j in 0..4 do
      if word[j].eql?(letter)
        result += 1
      end
    end
    result
  end

  def didnt_reallocate_to_another_position(word, engine_response, i)
    # criteria here could be number of yellow and greens for the letter to be equal to the number of
    # occurrences of the letter in the guess word, but outside where it would be wrong
    occurrences_in_engine_response = count_number_of_given_letters(word, engine_response, i)
    occurrences_in_guess_word = number_of_given_letter(word, engine_response.player_guess[i])
    return !(occurrences_in_engine_response.eql?(occurrences_in_guess_word) and word[i] != engine_response.player_guess[i])
  end

  def didnt_change_position_properly(word, engine_response, i)
    didnt_change_position_at_all(word, engine_response, i) or
      didnt_reallocate_to_another_position(word, engine_response, i)
  end

  def changes_position_of_yellow_letters(word, engine_response)
    for i in 0..4 do
      if engine_response.color_array[i] == 'y'
        if didnt_change_position_properly(word, engine_response, i)
          return false
        end
      end
    end
    true
  end

  def mantains_position_of_green_letters(word, engine_response)
    for i in 0..4 do
      if engine_response.color_array[i].eql?('g')
        if not word[i].eql?(engine_response.player_guess[i])
          return false
        end
      end
    end
    return true
  end

  def matches_criteria(word, engine_response)
    does_not_contain_eliminated_letter(word) and
      changes_position_of_yellow_letters(word, engine_response) and
      mantains_position_of_green_letters(word, engine_response)
  end

  def add_wrong_words_to_set(engine_response)
    for i in 0..4 do
      if engine_response.color_array[i].eql?('w')
        @wrong_letters.add(engine_response.player_guess[i])
      end
    end
  end

  def next_guess(engine_response)
    add_wrong_words_to_set(engine_response)
    word_file = File.open "five_letter_words.txt"
    words = word_file.readlines
    for word in words
      if matches_criteria(word, engine_response)
        return word
      end
    end
  end

end
