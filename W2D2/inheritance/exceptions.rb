class IllegalMoveError < RuntimeError
end

class Game
  def move_forward(pos1, pos2)
    if pos2 < pos1
      raise IllegalMoveError
    elsif pos2 > pos1 + 1
      raise IllegalMoveError.new("cannot jump forward")
    end

    # raise a method not found exception
    # asdflkjasdfmasvjlkasdf
  end
end

g = Game.new

begin
  puts "Input current location"
  current = gets.chomp.to_i
  puts "Input next location"
  nextt = gets.chomp.to_i

  g.move_forward(current, nextt)

  puts "MOVE SUCCESSFULLY MADE"

  unhandled_exception_raised_here!

rescue IllegalMoveError => e
  puts "ILLEGAL MOVE!"
  p e.message
  retry
end
