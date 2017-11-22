class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :count

  def initialize
    @queue = Array.new
    @head = nil
    @tail = nil
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    @queue.slice!(0)
  end

  def empty?
    return true if @queue.length == 0
    false
  end
end