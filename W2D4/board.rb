require 'colorize'
require_relative 'piece'

class Board
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end
  
  def place_piece(color, pos)
    self[pos] = Piece.new(color, pos, self)
  end
  
  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y]
  end
  
  def []=(pos, piece)
    x, y = pos[0], pos[1]
    @grid[x][y] = piece
  end
  
  def all_pieces
    @grid.flatten.reject { |square| square.nil? }
  end
  
  def display
    @grid.each_with_index do |row, i|
      print "#{8 - i} "
      row.each_index do |j|
        pos = [i, j]
        if (i + j).odd?
          print square(pos).on_light_black
        else
          print square(pos).on_white
        end
      end
      print "\n"
    end
    
    print "   A  B  C  D  E  F  G  H \n"
    
  end
  
  def square(pos)
    if self[pos].nil?
      "   "
    else
      " #{self[pos].symbol} "
    end
  end
  

  
  
  
end

bd = Board.new
bd.place_piece(:red, [6, 5])
bd.place_piece(:red, [4, 3])
bd.place_piece(:black, [6, 1])
bd[[6, 1]].is_king = true
p bd[[6, 5]].moves
p bd[[4, 3]].moves
p bd[[6, 1]].moves
bd.display

bd[[6, 1]].perform_slide([5, 2])
p bd[[5, 2]].moves
bd.display

bd[[5, 2]].perform_jump([3, 4])
p bd[[3, 4]].moves

bd.display

bd[[6, 5]].perform_slide([7, 4])
p bd[[7, 4]].moves
bd.display
