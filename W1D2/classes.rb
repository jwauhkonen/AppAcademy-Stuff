class Student

  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def courses
    @courses.map { |course| course.name }
  end

  def enroll(course)
    unless @courses.include?(course)
      @courses << course
      course.add_student(self)
    end
  end

  def course_load
    load_per_dept = Hash.new(0)

    @courses.each do |course|
      # puts course
#       puts course.dept
#       puts course.credits
      load_per_dept[course.dept] += course.credits
    end

    load_per_dept
  end
end

class Course

  attr_reader :name, :dept, :credits

  def initialize(name, dept, credits)
    @name = name
    @dept = dept
    @credits = credits
    @students = []
  end

  def students
    @students.map { |student| student.name }
  end

  def add_student(student)
    unless @students.include?(student)
      @students << student
      student.enroll(self)
    end
  end

end

# mary = Student.new("Mary", "Oliver")
# scooby = Student.new("Scooby", "Doo")
# shaggy = Student.new("Shaggy", "G")
#
# math = Course.new("Math", :Science, 4)
# art = Course.new("Art", :Art , 4)
# physics = Course.new("Physics", :Science, 5)
#
# scooby.enroll(math)
# scooby.enroll(physics)
# scooby.enroll(art)
# mary.enroll(physics)
# shaggy.enroll(math)
# puts scooby.course_load
# puts mary.course_load
# puts shaggy.course_load
# p scooby.courses
# p mary.courses
# p shaggy.courses
# p math.students
# p art.students
# p physics.students





class Board
  def initialize
    @layout = [
      [".", ".", "."],
      [".", ".", "."],
      [".", ".", "."]
    ]

  end
  
  def columns
    columns = [[], [], []]
    
    @layout.each do |row|
      row.each_index do |i|
        columns[i] << row[i]
      end
    end
    
    columns
  end

  def won?
    @layout.each do |row|
      return true if row = ["0", "0", "0"] || row = ["X", "X", "X"]
    end

    columns.each do |column|
      return true if column = ["0", "0", "0"] || column = ["X", "X", "X"]
    end
    
    return true if @layout[0][0], @layout[1][1], @layout[2][2] == "O", "O", "O"
    return true if @layout[0][0], @layout[1][1], @layout[2][2] == "X", "X", "X"
    return true if @layout[0][2], @layout[1][1], @layout[2][0] == "O", "O", "O"
    return true if @layout[0][2], @layout[1][1], @layout[2][0] == "X", "X", "X"
    
    false
  end

  def winner

  end

  def empty?(pos)
    @layout[pos] = "."
  end

  def place_mark(pos, mark)
    @board_layout[pos[0]][pos[1]] = mark
  end

end

class Game
  def play
    #prompt play
    #until over
    #comp play
  end

  def prompt_play
  end
end

class Player
  
  def make_move
    
  end

end

class HumanPlayer < Player
  
  def initialize
    @player_mark = "X"
  end
  
  def make_move
    puts "make your move!"
    puts "gimme an x coordinate!"
    x = gets.chomp
    puts "gimme a y coordinate!"
    y = gets.chomp
    Board.place_mark([x,y], @player_mark)
  end

end

class ComputerPlayer < Player
  
  def initialize
    @player_mark = "O"
  end
  
  def make_move

end


  
