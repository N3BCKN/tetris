class Board
  attr_accessor :grid

  def initialize
    @grid  = Array.new(HEIGH / TILE_SIZE) { Array.new(WIDTH / TILE_SIZE, 0) }
    @paints = Paint.new
  end

  def draw
    @grid.each_with_index do |row, i|
      row.each_with_index do |val, j|
        Square.new(x: j * TILE_SIZE, y: i * TILE_SIZE , size: TILE_SIZE - 1, color: @paints[val])
      end
    end 
  end

  def [](index)
    col,row = index
    @grid[col][row]
  end 

  def []=(index,val)
    col,row = index  
    @grid[col][row] = val
  end
end 
