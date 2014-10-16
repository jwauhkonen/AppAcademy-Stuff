class Code
  attr_accessor :code
  
  def initialize(input = nil)
    @colors = [:R, :G, :B, :Y, :O, :P]
    input.nil? ? @code = random_code : @code = user_code(input)
  end

  def user_code(input)
    user_code = []

    input.each_char do |char|
      user_code.push(char.to_sym)
    end
    
    user_code
  end
    

  def random_code
    random_code = []
    
    4.times do
      random_code.push(@colors.sample)
    end
    
    random_code
  end
  
  def exact_matches(other_code)
    match_indices = []
    @code.each_index do |i|
      @code[i] == other_code.code[i] ? match_indices << i : false
    end 

    match_indices
  end
  
  def exact_match_count(other_code)
    exact_matches(other_code).length
  end
  
  def near_match_count(other_code)
    match_counter = 0

    code_dup, other_code_dup = remove_exact_matches(other_code)
    code_dup.delete(nil)
    other_code_dup.delete(nil)
    
    @colors.each do |sym|
      match_counter += [code_dup.count(sym), other_code_dup.count(sym)].min
    end 
  
    match_counter
  end
  
  
  def remove_exact_matches(other_code)
    null_indices = exact_matches(other_code)
  
    code_dup = @code.dup
    other_code_dup = other_code.code.dup
  
    code_dup.map!.with_index { |x, i| null_indices.include?(i) ? nil : x }
    other_code_dup.map!.with_index { |x, i| null_indices.include?(i) ? nil : x }
    
    [code_dup, other_code_dup]
  end
  
end

class Game
  
  def initialize
    @correct_code = Code.new
    @turns_passed = 0
  end
  
  def play
    
    while @turns_passed < 10
      puts
      puts "input a string of four letters from: 'RGBYOP'"
      user_code = Code.new(gets.chomp)
      
      exact_matches = @correct_code.exact_match_count(user_code)
      near_matches = @correct_code.near_match_count(user_code)
      
      puts "#{exact_matches} exact matches"
      puts "#{near_matches} near matches"
      puts @correct_code.code
      
      if won?(exact_matches)
        puts "Congratulations!"
        return
      end

      @turns_passed += 1

    end  
    
    puts "You lose!"
  end
    
  def won?(exact_matches)
    exact_matches == 4
  end
end


game = Game.new
game.play
