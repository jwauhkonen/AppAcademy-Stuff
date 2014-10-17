require_relative 'board'
require 'debugger'

class InputError < StandardError ;end

class Checkers
  
  LETTER_VALUES = { "A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4,
                    "F" => 5, "G" => 6, "H" => 7 }
  
  
  attr_accessor :board
  
  def initialize
    @board = Board.new
    @current_turn = :red
  end
  
  def play
    begin
      until winner?
        @board.display
        piece = @board[get_piece.flatten]
        sequence = get_sequence_from_player
        piece.perform_moves(sequence, @current_turn)
        @current_turn == :red ? @current_turn = :black : @current_turn = :red
      end
      
      @board.display
      puts "#{winner?} is the winner!" if winner?
    end
  rescue InvalidMoveError => move_error
    puts move_error
    retry

  end
  
  def get_piece
    puts "Turn: #{@current_turn}"
    puts "Pick a piece to move in the format of 'A3'"
    
    piece = parse_move(gets.chomp)
  end
  
  def get_sequence_from_player
    puts "Enter your move in the format of 'B4'"
    puts "or 'C5, A7' for mulitple jumps"
    
    moves = parse_move(gets.chomp)
  end
  
  def parse_move(input)
    selections = input.split(",").map { |selection| selection.strip.split("") }
    moves = selections.map { |selection| translate_h_to_c(selection) }
  end
  
  def translate_h_to_c(selection)
    [8 - selection[1].to_i, LETTER_VALUES[selection[0].upcase]]
  end
  
  
  def winner?
    return :red if board.all_pieces.all? { |piece| piece.color == :red }
    return :black if board.all_pieces.all? { |piece| piece.color == :black }
  end
  
end


check = Checkers.new
check.play