def towers_of_hanoi
  piles = { pile1: [ 3, 2, 1], pile2: [], pile3: [] }
  game_won = false

  until game_won
    puts "current configuration:"
    p "    pile1: #{piles[:pile1]}"
    p "    pile2: #{piles[:pile2]}"
    p "    pile3: #{piles[:pile3]}"

    puts "which pile do you want to pick a disc from?"
    puts "'pile1', 'pile2', or 'pile3'"
    from_pile = gets.chomp
    puts "on which pile do you want to place the disc?"
    puts "'pile1', 'pile2', or 'pile3'"
    to_pile = gets.chomp

    if !piles[from_pile.to_sym].empty?
      if piles[to_pile.to_sym].empty? || piles[from_pile.to_sym].last < piles[to_pile.to_sym].last
        piles[to_pile.to_sym].push(piles[from_pile.to_sym].pop)
      else
        puts "cannot make such move!"
      end
    else
      puts "cannot make such move!"
    end


    if piles[:pile2] == [3,2,1] || piles[:pile3] == [3,2,1]
      game_won = true
      puts "you win!"
    end

  end
end

class TowersGame

  def initialize
    @piles = { pile1: [ 3, 2, 1], pile2: [], pile3: [] }
    @game_won = false
  end

  def display_towers
    puts "current configuration:"
    p "    pile1: #{@piles[:pile1]}"
    p "    pile2: #{@piles[:pile2]}"
    p "    pile3: #{@piles[:pile3]}"
  end

  def get_user_input
    puts "which pile do you want to pick a disc from?"
    puts "'pile1', 'pile2', or 'pile3'"
    from_pile = gets.chomp
    puts "on which pile do you want to place the disc?"
    puts "'pile1', 'pile2', or 'pile3'"
    to_pile = gets.chomp

    [from_pile.to_sym, to_pile.to_sym]
  end

  def valid_move?(from, to)
    if !@piles[from].empty?
      if @piles[to].empty? || @piles[from].last < @piles[to].last
        @piles[to].push(@piles[from].pop)
      else
        puts "cannot make such move!"
      end
    else
      puts "cannot make such move!"
    end
  end

  def game_over?
    if @piles[:pile2] == [3,2,1] || @piles[:pile3] == [3,2,1]
      puts "you win!"
      return true
    end
  end

  def play
    until game_over?
      display_towers
      inputs = get_user_input
      valid_move?(inputs[0], inputs[1])
    end
  end

end

towers_of_hanoi = TowersGame.new
towers_of_hanoi.play
