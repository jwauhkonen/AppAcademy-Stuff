class MyHashSet
  def initialize
    @store = Hash.new
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.keys.include?(el)
  end

  def delete(el)
    if self.include?(el)
      @store.delete(el)
      return true
    else
      return false
    end
  end

  def to_a
    @store.keys
  end

  def union(set2)
    output = MyHashSet.new
    @store.each_key do |item|
      output.insert(item) unless set2.include?(item)
    end

    set2.to_a.each do |item|
      output.insert(item) unless self.include?(item)
    end

    output
  end

  def intersect(set2)
    output = MyHashSet.new
    @store.each_key do |item|
      output.insert(item) if set2.include?(item)
    end

    output
  end

  def minus(set2)
    output = MyHashSet.new
    @store.each_key do |item|
      output.insert(item) unless set2.include?(item)
    end

    output
  end

end


new_set = MyHashSet.new

new_set.insert(:something)
new_set.insert(:something_else)
new_set.insert(:anything)

newer_set = MyHashSet.new

newer_set.insert(:anything)
newer_set.insert(:whatever)

p new_set.union(newer_set)

p new_set.intersect(newer_set)

p new_set.minus(newer_set)
