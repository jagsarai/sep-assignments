require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
      if root.right 
        root = root.right 
        insert(root, node)
      else
        root.right = node
      end
    elsif root.rating > node.rating
      if root.left 
        root = root.left 
        insert(root, node)
      else
        root.left = node
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if root == nil  
    return root if root.title == data 
    root.right ? find(root.right, data) : find(root.left, data)
  end

  def delete(root, data)
    return nil if data == nil 

    node = find(root, data)
    
    if node.rating < root.rating 
      root.left = delete(root.left, data)
    elsif node.rating > root.rating 
      root.right = delete(root.right, data)
    elsif root.title == data 
      if root.left == nil and root.right == nil 
        root = nil
      elsif root.left == nil 
        root = root.right
      elsif root.right == nil 
        root = root.left 
      else
        temp = find_min_node(root.right)
        root.rating = temp.rating
        root.title = temp.title
        root.right = delete(root.right, temp.title)
      end
    end
  end

  def find_min_node(node)
		if node.left.nil?
			min_node = node
			min_node
		else
		  find_min_node(node.left)
		end
	end


  # Recursive Breadth First Search
  def printf(children=nil)
    return nil if @root == nil 

    queue = [];
    queue.push(@root);

    while queue.size != 0 do 
      @root = queue[0]
  
      queue.push(@root.left) if @root.left
      queue.push(@root.right) if @root.right

      puts @root.title.to_s + ': ' + @root.rating.to_s
      queue.shift()
    end
  end
end
