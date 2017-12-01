require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = @items[index(key, @items.size)]
    if item.class != NilClass and item.value == value
      value
    elsif item == nil
     @items[index(key, @items.size)] =  Node.new(key, value)
    else
      index = next_open_index(index(key, @items.size))
      until index != -1 
        self.resize
        index = next_open_index(index(key, @items.size))
      end
      @items[index] = Node.new(key, value)
    end
  end

  def [](key)
    @items[index(key, @items.size)] == nil ? nil : @items.find{|obj| obj != nil and obj.key == key }.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    index = 0
    key.each_byte do |letter| 
      index += letter
    end
    index % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    temp = @items.index{|obj| obj == nil}
    temp == nil ? -1 : temp 
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize 
    temp = @items 
    @items = Array.new(self.size * 2)
    temp.each_with_index do |obj, key|
      obj != nil ? @items[index(obj.key, @items.size)] = obj : @items[key] = obj
    end 
  end
end
