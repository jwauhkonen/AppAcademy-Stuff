require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    present_node = TicTacToeNode.new(game.board, mark)
    
    present_node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end
    
    present_node.children.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end
    
    raise "cannot find win or draw inducing move"
    
  end
end

if __FILE__ == $PROGRAM_NAME
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(cp, hp).run
end
