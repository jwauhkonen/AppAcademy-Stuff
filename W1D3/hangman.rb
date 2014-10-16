require './player_classes.rb'

class Hangman
  
  attr_accessor :letters_guessed, :word, :word_so_far
  
  def initialize(guessing_player, checking_player)
    @letters_guessed = []
    guessing_player == "Human" ? @guessing_player = HumanPlayer.new(self) :
      @guessing_player = ComputerPlayer.new(self)
    checking_player == "Human" ? @checking_player = HumanPlayer.new(self) :
      @checking_player = ComputerPlayer.new(self) 
    @word = @checking_player.get_word
    @word_so_far = empty_word
  end
  
  def empty_word
    output = ""
    @word.length.times do
      output += "_"
    end
    output
  end
  
  def display
    puts "Secret word: #{@word_so_far}"
  end
  
  def won?
    !@word_so_far.include?("_")
  end
  
  def play
    display
    
    while !won?
      guess = @guessing_player.guess_letter
      @checking_player.check_word(guess)
      display
      
    end
    
    #let it know which player won..
    puts "You Win!"
    
  end

end




c = Hangman.new('a', 'Human')
c.play