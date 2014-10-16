class InvalidMoveError < StandardError ;end

class Piece
  
  UP_MOVES = [[-1, -1], [-1, 1]]
  DOWN_MOVES = [[1, -1], [1, 1]]
  
  attr_accessor :color, :pos, :is_king
  
  def initialize(color, pos, is_king = false, board)
    @color = color
    @pos = pos
    @is_king = is_king
    @board = board
  end
  
  def symbol
    @is_king ? "@".colorize(color) : "o".colorize(color)
  end
  
  def perform_moves(*moves)
    if valid_move_seq?(*moves)
      perform_moves!(*moves)
    end
  end
  
  def valid_move_seq?(*moves)
    begin
      new_board = @board.new_dup
      @board.new_dup[@pos].perform_moves!(*moves)
    rescue InvalidMoveError => move_error
      puts move_error
      return false
    else
      true
    end
  end
  
  def moves
   slide_moves + jump_moves
  end
  
  def slide_moves
    slide_moves = []
    
    move_diffs.each do |diff|
      slide = [pos[0] + diff[0], pos[1] + diff[1]]
      slide_moves << slide if in_bounds?(slide) && @board[slide].nil? 
    end
    
    slide_moves
  end
  
  def jump_moves
    jump_moves = []
    
    move_diffs.each do |diff|
      jump = [pos[0] + (diff[0] * 2), pos[1] + (diff[1] * 2)]
      if in_bounds?(jump) && !@board[between(jump)].nil?
        jump_moves << jump unless @board[between(jump)].color == self.color
      end
    end
    
    jump_moves
  end
  
  def perform_moves!(*moves)
    
    if moves.length == 1
      slide_moves.include?(moves[0]) ? perform_slide(moves[0]) : perform_jump(moves[0])
    else
      moves.each do |new_pos|
        perform_jump(new_pos)
      end
    end
        
  end
  
  def perform_slide(new_pos)
    if slide_moves.include?(new_pos)
      @board[@pos] = nil
      @pos = new_pos
      @board[@pos] = self
      maybe_promote
      true
    else
      false
      raise InvalidMoveError.new("Cannot slide from #{@pos} to #{new_pos}!")
    end
  end
  
  def perform_jump(new_pos)
    if jump_moves.include?(new_pos)
      @board[@pos] = nil
      @board[between(new_pos)] = nil
      @pos = new_pos
      @board[@pos] = self
      maybe_promote
      true
    else
      false
      raise InvalidMoveError.new("Cannot jump from #{@pos} to #{new_pos}!")
    end
  end
  
  
  private
  
  
  def in_bounds?(pos)
    pos.all? { |i| i >= 0 && i < 8 }
  end
  
  def maybe_promote
    @is_king = true if @color == :red && @pos[0] == 7
    @is_king = true if @color == :black && @pos[0] == 0
  end
  
  def between(new_pos)
    [(@pos[0] + new_pos[0]) / 2, (@pos[1] + new_pos[1]) / 2]
  end
  
  def move_diffs
    if @is_king
      UP_MOVES + DOWN_MOVES
    elsif @color == :red
      DOWN_MOVES
    else
      UP_MOVES
    end
  end
  
end