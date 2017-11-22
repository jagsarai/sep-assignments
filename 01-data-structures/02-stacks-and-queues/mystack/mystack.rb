class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item 
    @top = @stack[@stack.length - 1]
  end

  def pop
    item = @stack.slice!(@stack.length - 1)
    @top = @stack[@stack.length - 1]
    return item
  end

  def empty?
    return true if @stack.length == 0
    false
  end
end