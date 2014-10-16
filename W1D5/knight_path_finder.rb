class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)

    #reassigns @parent, if @parent already exists and different from new_parent
    unless @parent.nil? && @parent != new_parent
      @parent.children.delete(self)
    end

    @parent = new_parent

    # add yourself as a child unless there is no parent to add to
    # or youre already a child of the new parent
    unless @parent.nil? || @parent.children.include?(self)
      @parent.children << self
    end

  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    child.parent = nil
  end

  def dfs(data)

    if self.value == data
      return self
    end


    @children.each do |kid|
      kid_value = kid.dfs(data)
      return kid_value unless kid_value.nil?
    end
    nil
  end

  def bfs(data)
    queue = []
    queue << self

    until queue.empty?
      current_node = queue[0]
      # if current_node.children

      return current_node if current_node.value == data

      queue += (queue.shift).children
    end

    nil
  end

end


class KnightPathFinder
  # attr_reader :pos
  # attr_accessor :visited_positions

  POSSIBLE_SHIFTS = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ]


  def initialize(starting_pos = [0, 0])
    @starting_pos = starting_pos
    @visited_positions = [@starting_pos]
    build_move_tree
  end

  def new_move_positions(pos)
    new_moves = self.class.valid_moves(pos).select do |move|
      !@visited_positions.include?(move)
    end
    @visited_positions += new_moves
    new_moves
  end

  def self.valid_moves(pos)
    possible_moves = POSSIBLE_SHIFTS.map do |x, y|
      [pos[0] + x , pos[1] + y]
    end

    possible_moves.select { |move|
            move.all? { |idx| idx <= 7 && idx >= 0 } }
  end




  def build_move_tree
    @root = PolyTreeNode.new(@starting_pos)
    queue = [@root]


    until queue.empty?

      knight_node = queue.shift
      # knight = knight_node.value
      # knight_position = knight.pos
      # knight_path = knight.visited_positions

      # if knight_position == coord
        # return knight_path
      # end

      new_move_positions(knight_node.value).each do |position|
        knight_node.add_child(PolyTreeNode.new(position))
      end

      queue += knight_node.children
    end
    # @root
  end

  def find_path(pos)

    node = @root.bfs(pos)

    positions = []
    while node.parent != nil
      positions.unshift(node.value)
      node = node.parent
    end
    positions.unshift(@starting_pos)

  end

  # def birth_knight_node(knight_path, position)
  #   visited_positions = knight_path + [position]
  #   new_knight_child = KnightPathFinder.new(position, visited_positions)
  #   PolyTreeNode.new(new_knight_child)
  # end


end

kpf = KnightPathFinder.new([0, 0])

p kpf.find_path([6,2])



