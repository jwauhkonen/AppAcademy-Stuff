class TowersOfHanoi
  
  attr_reader :towers
  
  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end
  
  def move(source, target)
    from = @towers[source]
    to = @towers[target]
    if from.empty?
      raise StandardError
    elsif !to.empty? && (to.last < from.last)
      raise "Rat Farts!"
    end
    
    to.push(from.pop)
  end
  
  def play
    
    until game_over?
      
      puts "Enter move (source, destination) e.g 1,2: "
      move = $stdin.gets.chomp
      #towers.move(move)
      
    end
    
    puts "Game over: you won!"
    
  end
  
  def game_over?
    @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end
end