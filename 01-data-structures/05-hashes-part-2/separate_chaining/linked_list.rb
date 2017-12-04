require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if !self.head
      self.head = node
      self.tail = node
    else
      current = self.head
      while current.next != nil do
        current = current.next
      end
      current.next = node
      self.tail = node
    end
    self
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      current = self.head
      while current.next != self.tail do 
        current = current.next
      end
      self.tail = current
      self.tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = self.head
    while current do
      puts current.data
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = self.head
    if current == node 
      self.head = current.next
    elsif self.tail == node 
      while current.next != self.tail do 
        current = current.next
      end
      self.tail = current 
      self.tail.next = nil
    else
      while current.next != node do
        current = current.next
      end
      current.next = node.next 
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if !self.head
      self.head = node
      self.tail = node
    else
      current = self.head
      node.next = current
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    current = self.head
    current.next != nil ? self.head = current.next : self.head = nil
  end
end