class MazeSolver
  
  def initialize(maze)
    @maze = construct_maze(maze)
  end
  
  attr_reader :maze
  
  def construct_maze(maze)
    @maze = []
    lines = File.readlines(maze)
    lines.each do |line|
      @maze << line.chomp.split("")
    end
    
    @maze
  end
  
  def print_maze
    @maze.each { |line| p line }
  end
    
  
  
end


solver = MazeSolver.new('maze1.txt')

solver.print_maze
