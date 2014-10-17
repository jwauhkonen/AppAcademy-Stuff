require 'colorize'
require_relative 'piece'

class Board
  
  def initialize(setup = true)
    @grid = Array.new(8) { Array.new(8) }
    populate_board if setup
  end
  
  def populate_board
    (0..2).each do |i|
      (0..7).each do |j|
        place_piece(:red, [i, j], false) if (i + j).odd?
      end
    end
    
    (5..7).each do |i|
      (0..7).each do |j|
        place_piece(:black, [i, j], false) if (i + j).odd?
      end
    end
    
  end
  
  def place_piece(color, pos, is_king)
    self[pos] = Piece.new(color, pos, is_king, self)
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
    @grid.flatten.compact
  end
  
  def new_dup
    new_board = Board.new(false)
    all_pieces.each do |piece|
      new_board.place_piece(piece.color, piece.pos, piece.is_king)
    end
    
    new_board
  end
  
  def display
    @grid.each_with_index do |row, i|
      print "#{8 - i} "
      row.each_index do |j|
        pos = [i, j]
        if (i + j).odd?
          print tile_display(pos).on_light_black
        else
          print tile_display(pos).on_white
        end
      end
      print "\n"
    end
    
    print "   A  B  C  D  E  F  G  H \n"
    
  end
  
  def tile_display(pos)
    if self[pos].nil?
      "   "
    else
      " #{self[pos].symbol} "
    end
  end
  
end
#
# bd = Board.new
# bd.place_piece(:red, [6, 5], false)
# bd.place_piece(:red, [4, 3], false)
# bd.place_piece(:red, [2, 5], false)
# bd.place_piece(:black, [6, 1], true)
# p bd[[6, 5]].moves
# p bd[[4, 3]].moves
# p bd[[6, 1]].moves
# bd.display
#
# bd[[6, 1]].perform_slide([5, 2])
# p bd[[5, 2]].moves
# bd.display
#
# p bd[[5,2]].valid_move_seq?([3, 4], [1, 6])
# p bd[[5,2]].valid_move_seq?([3, 4], [1, 7])
# p bd[[5,2]].valid_move_seq?([3, 4])
#
#
#
# bd[[5, 2]].perform_moves([3, 4], [1, 6])
# p bd[[1, 6]].moves
# bd.display
#
# bd[[6, 5]].perform_slide([7, 4])
# p bd[[7, 4]].moves
# bd.display
