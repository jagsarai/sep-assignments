require_relative 'hash_item'

class HashClass
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = @items[index(key, @items.size)]
    
    if item.class != NilClass and item.value == value
      value
    elsif item == nil
      @items[index(key, @items.size)] = HashItem.new(key, value)
    else
      #base case of array size 1 and collision
      if @items.size === 1
        self.resize
        @items[index(key, @items.size)] = HashItem.new(key, value)
        return @items  
      end

      #array size will double until collision is resloved
      until item == nil 
        self.resize 
        item = @items[index(key, @items.size)]
      end
      @items[index(key, @items.size)] = HashItem.new(key, value)
    end
  end


  def [](key)
    @items[index(key, @items.size)] != nil ? @items[index(key, @items.size)].value : nil
  end

  def resize 
    temp = @items 
    @items = Array.new(self.size * 2)
    temp.each_with_index do |obj, key|
      obj != nil ? @items[index(obj.key, @items.size)] = obj : @items[key] = obj
    end 
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

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end