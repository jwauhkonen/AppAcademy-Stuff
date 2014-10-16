# Abstract base class
class Animal
  attr_reader :weight
  def initialize(weight)
    @weight = weight

    # ...Even more really complicated animal logic...
  end

  def make_noise
    raise "not implemented yet"
  end
end

# Animal.new.make_noise

class Cow < Animal
  attr_reader :num_spots

  # overriding Animal#initialize
  def initialize(weight = 1600, num_spots = 0)
    super(weight) # setup base class
    # rest is setting up this particular subclass

    @num_spots = num_spots
  end

  def make_noise
    puts "Moo"
  end
end

class AngryCow < Cow
  def make_noise
    super
    puts "Mooing does not satiate my anger"
  end
end

class Horse < Animal
  # def initialize(weight = 30_000)
  #   @weight = weight
  # end

  def make_noise
    puts "neigh!"
  end

  def cant
    puts "run around!"
  end
end

class Keanu < Animal
  def make_noise
    puts "whoa"
  end
end

class Barn
  # # should contain only Animal subclasses.
  # attr_reader :animals

  def initialize
    @animals = []
  end

  def animals
    # defensive copy
    @animals.dup
  end

  def add_animal(animal)
    if animal.is_a?(Animal)
      @animals << animal
    else
      raise "can only add Animal subclasses"
    end
  end

  def disturb!
    self.animals.each do |animal|
      animal.make_noise
    end
  end

  def weight
    total_weight = 0
    self.animals.each do |animal|
      total_weight += animal.weight
    end

    total_weight
  end
end

c = AngryCow.new(1600, 100)
p c.weight
c.make_noise


# b = Barn.new
# b.add_animal(Cow.new(1600, 100))
# b.add_animal(Cow.new(1600, 1_000))
# b.add_animal(Horse.new(400))
# puts b.weight
#
# b.disturb!
