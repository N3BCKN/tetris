class Board
  attr_accessor :grid

  def initialize
    @grid   = Array.new(HEIGHT / TILE_SIZE) { Array.new(WIDTH / TILE_SIZE, 0) }
    @paints = Paint.new
  end

  def draw
    rows = 0
    cols = 0
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

  def clean_full_rows
    row_index = 20
    completed = 0 

    while (row_index -= 1) >= 0
      if is_full_row?(row_index)
        clear_row(row_index)
        completed += 1
      elsif completed > 0
        move_row_down(row_index, completed)
      end
    end
    
    completed
  end
  
  private
  def clear_row(row_index)
    grid[row_index].map! {|elem| elem = 0}
  end

  def move_row_down(row_index, completed)
    grid[row_index].each_with_index do |_,j|
      grid[row_index + completed][j] = grid[row_index][j]
    end
    clear_row(row_index)
  end

  def is_full_row?(row_index)
    grid[row_index].none? { |elem| elem == 0 }
  end
end 
