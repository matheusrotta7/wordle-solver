class Utils
  def self.pick_random_word_from_file
    word_file = File.open "five_letter_words.txt"
    words = word_file.readlines
    return words[rand(0..words.length-1)]
  end
end
