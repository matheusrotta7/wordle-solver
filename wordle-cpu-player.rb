require 'set'

class WordlePlayer

  def initialize
    @wrong_letters = Set.new()
  end

  def first_guess
    return Utils.pick_random_word_from_file
  end

  def does_not_contain_eliminated_letter(word)
    # code here
  end

  def matches_criteria(word)
    if does_not_contain_eliminated_letter(word) and

    end
  end

  def add_wrong_words_to_set(engine_response)
    for char in engine_response:

    end
  end

  def next_guess(engine_response)
    add_wrong_words_to_set(engine_response)
    word_file = File.open "five_letter_words.txt"
    words = word_file.readlines
    for word in words
      if (matches_criteria(word))
        return word
      end
    end
  end

end
