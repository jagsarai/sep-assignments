require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :list

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    item = @items[index(key, @items.size)]
    if item == nil
     list = LinkedList.new
     @items[index(key, @items.size)] =  list
     list.add_to_front(Node.new(key, value))
    else
     @items[index(key, @items.size)].add_to_front(Node.new(key, value))
    end
    print(key)
  end

  def [](key)
    list = @items[index(key, @items.size)]
    if list
      current = list.head
      while current != nil do 
        if current.key == key
          return current.value
        end
        current = current.next 
      end
    end  
    nil   
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

  # Calculate the current load factor
  def load_factor
    total = 0
    @items.map{|linked_list| total += find_count(linked_list)}
    until total/@items.size.to_f <= 0.7
      self.resize
      self.load_factor
    end
    total/@items.size.to_f 
  end

  #Find the length of the Linked List
  def find_count(list)
    if list == nil
      0
    elsif list.head.next == nil
      1
    else
      count = 0
      current = list.head
      while current != nil do 
        count += 1
        current = current.next 
      end
      count
    end
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
      obj == nil ? @items[key] = obj : @items[index(obj.head.key, @items.size)] = obj
    end 
  end

  #Print out state of Hash
  def print(key)
    p 'load factor: ' + load_factor.to_s
    p 'index: ' + index(key, @items.size).to_s
    if @items[index(key, @items.size)].head.next
      current = @items[index(key, @items.size)].head
      p 'value is ' + current.value.to_s
      until current.next == nil 
        p 'value is ' + current.next.value.to_s
        current = current.next
      end
    else
      p 'value is ' + @items[index(key, @items.size)].head.value.to_s
    end
  end
end
