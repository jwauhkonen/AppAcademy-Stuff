class HumanPlayer
  def initialize(game)
    @game = game
  end
  
  attr_reader :letters_guessed
  
  def get_word
    puts "How many letters is your word"
    word_length = gets.chomp.to_i
    
    output = ""
    word_length.times do
      output += "_"
    end
    output
  end
  
  def guess_letter
    puts "guess a letter"
    guess = gets.chomp
    @game.letters_guessed << guess
    guess
  end
  
  def check_word(guess)
    indices = []
    
    puts "Does this word contain #{guess}?"
    answer = gets.chomp
    if answer == "yes"
      puts "At what indices?"
      gets.chomp.split(" ").each do |index|
        indices << index.to_i
      end
      

      add_letter(guess, indices)  
    end
     
    @game.word_so_far
  end
  
  def add_letter(guess, indices)
    word_arr = @game.word_so_far.split("")
    word_arr.each_index do |i|
      if indices.include?(i)
        word_arr[i] = guess
      end
    end
    
    
    @game.word_so_far = word_arr.join("")
  end
  
  
end

class ComputerPlayer
  def initialize(game)
    @game = game
    @words = File.readlines('dictionary.txt').map(&:chomp)
  end
  
  attr_reader :letters_guessed
  
  def get_word
    @words.sample
  end
  
  def word_so_far_chars
    @game.word_so_far.split("")
  end
  
  def possible_words_by_length
    dict_subset = @words.select  { |word| word.length == @game.word.length }
    
  end
  
  def possible_words_by_guesses
    so_far_chars = word_so_far_chars
    dict_subset = possible_words_by_length
    
    wrong_words = []
    dict_subset.select! do |word|
      letters_arr = word.split("")
      letters_arr.each_index do |j|
         wrong_words.push(word) if !((letters_arr[j] == so_far_chars[j]) || so_far_chars[j] == "_")
      end
    end
    
    dict_subset.keep_if do |word|
      !wrong_words.include?(word)
    end
    
    p dict_subset.length
    dict_subset
  end
  
  def total_possible_characters
    possible_words_by_guesses.join("").split("")
  end
  
  def most_common_character
    highest_value = 0
    highest_key = ""
    
    char_frequency = Hash.new(0)
    total_possible_characters.each do |char|
      char_frequency[char] += 1
    end
    
    char_frequency.each do |key, value|
      if value > highest_value && !@game.letters_guessed.include?(key)
        highest_key = key
        highest_value = value
      end
    end
    
    highest_key
  end
  
  
  def guess_letter
    p most_common_character
    guess = most_common_character
    
    p "guess: #{guess}"
    @game.letters_guessed << guess
    guess
  end
  
  def check_word(guess)    
    add_letter(guess)  
  end
  
  def add_letter(guess)
    word_arr = @game.word_so_far.split("")
    word_arr.each_index do |i|
      if @game.word[i] == guess
        word_arr[i] = guess
      end
    end
    
    @game.word_so_far = word_arr.join("")
  end
  
  
end
