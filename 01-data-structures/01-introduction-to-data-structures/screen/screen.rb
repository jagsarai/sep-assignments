require_relative 'pixel'
require 'matrix'

class Matrix
  public :"[]=", :set_element, :set_component
end

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix
  attr_accessor :row
  attr_accessor :col

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = inbounds(width, height)
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x,y] = pixel
  end

  def at(x, y)
    self.matrix[x,y]
  end

  private

  def inbounds(x, y)
    Matrix.build(x, y) do |row, col|
      build_matrix(row)
      build_matrix(col)
    end
  end
  
  def build_matrix(x)
    nil
  end

end