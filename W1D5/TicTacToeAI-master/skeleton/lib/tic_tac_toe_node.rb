require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def losing_node?(evaluator)
    
    if @board.over?
      if @board.tied? || @board.winner == evaluator
        # show
        # p "not a loser for #{evaluator}!"
        return false
      else
        # show
        # p "a loser for #{evaluator}!"
        return true
      end
    end
    
    if @next_mover_mark == evaluator
      return children.all? { |child| child.losing_node?(evaluator) }
    else
      return children.any? { |child| child.losing_node?(evaluator) }
    end
    
    
  end

  def winning_node?(evaluator)
    
    if @board.over?
      if @board.winner == evaluator
        # show
        # p "a winner for #{evaluator}!"
        return true
      else
        # show
        # p "not a winner for #{evaluator}!"
        return false
      end
    end
    
    if @next_mover_mark == evaluator
      return children.any? { |child| child.winning_node?(evaluator) }
    else
      return children.all? { |child| child.winning_node?(evaluator) }
    end

  end

  def change_mark
    @next_mover_mark == :x ? @next_mover_mark = :o : @next_mover_mark = :x
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    find_empty_spaces.map do |space|
      new_board = @board.dup
      new_board[space] = @next_mover_mark
      new_node = TicTacToeNode.new(new_board, @next_mover_mark, space)
      new_node.change_mark
      children << new_node
    end
    
    children
  end


  def find_empty_spaces
    empty_spaces = []

    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if @board.empty?([i, j])
          empty_spaces << [i, j]
        end
      end
    end

    empty_spaces
  end

  def show
    # not very pretty printing!
    self.board.rows.each { |row| p row }
    p " "
  end


end

node = TicTacToeNode.new(Board.new, :x)

 # node.children.each do |child|
 #   p child.losing_node?(:x)
 # end

# p node.winning_node?(:x)
