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

