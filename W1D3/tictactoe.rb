class Board
  
  def initialize
    @layout = [
      [nil, nil, nil],
      [nil, nil, nil], 
      [nil, nil, nil],
    ]
  end
  
  attr_accessor :layout
    
  def display
    @layout.each do |row|
      p row
    end
  end
  
  def columns
    columns = [[], [], []]
    
    @layout.each_with_index do |row, i|
      row.each_index do |j|
        columns[i][j] = @layout[j][i]
      end
    end
    
    columns
  end
  
  def place_mark(pos, mark)
    @layout[pos[0]][pos[1]] = mark
  end
  
  def empty?(pos)
    @layout[pos[0]][pos[1]] == nil
  end
  
  def winner(player)
    mark = player.mark
    
    @layout.each do |row|
      return true if row.all? { |pos| pos == mark }
    end
    
    columns.each do |column|
      return true if column.all? { |pos| pos == mark }
    end
    
    return true if [@layout[0][0], @layout[1][1], @layout[2][2]].all? { |pos| pos == mark }
    return true if [@layout[0][2], @layout[1][1], @layout[0][2]].all? { |pos| pos == mark }
    
    false
  end

  
end


class Game
  
  def initialize
    @board = Board.new
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end
  
  def play
    game_won = false
    
    while !game_won
    
      @board.display
    
      make_move(@human)
      
      make_move(@computer)
    
      if @board.winner(@human)
        puts "human wins!"
        game_won = true
      elsif @board.winner(@computer)
        puts "computer wins!"
        game_won = true
      end
    end
    puts "Game Over!"
    
  end
  
  def make_move(player)
    pos = [nil, nil]
    
    loop do
      pos = player.take_move
      if @board.empty?(pos)
        break
      end
    end
    
    @board.place_mark(pos, player.mark)
  end
  
  
  
end


class HumanPlayer
  
  def initialize
    @mark = "X"
  end
  
  attr_reader :mark
  
  def take_move
    puts "enter an x and y coordinate for your move"
    position = gets.chomp.split(" ")
    position.map { |num| num.to_i}
  end
  
end

class ComputerPlayer
  
  def initialize
    @mark = "O"
  end
  
  attr_reader :mark
  
  def take_move
    position = [rand(3), rand(3)]
  end
  
end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end