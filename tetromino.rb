class Tetromino
  attr_reader :id 

  def initialize(id)
    @id = id
    @cells = []
    @rotation_state = 0
    @row_offset = 0 
    @col_offset = 0
    @paints = Paint.new 
  end

  def move(col,row)
    @col_offset += col
    @row_offset += row
  end

  def cells_position
    tiles = @cells[@rotation_state]
    tiles.map {|tile| [tile[0] + @row_offset, tile[1] + @col_offset]}
  end

  def rotate
    @rotation_state == @cells.size - 1? @rotation_state = 0 : @rotation_state += 1
  end

  def undo_rotation
    @rotation_state == @cells.size - 1? @rotation_state = 0 : @rotation_state -= 1
  end

  def will_fit?(col, row)
    cells_position.all? {|cell| (0..15).include?(cell[0] + row) && (0..9).include?(cell[1] + col) }
  end

  def is_inside?
    cells_position.all? {|cell| (0..15).include?(cell[0]) && (0..9).include?(cell[1]) }
  end

  def draw
    grid = cells_position
    grid.each do |tile|
      Square.new(x: tile[1] * TILE_SIZE, y: tile[0] * TILE_SIZE, size: TILE_SIZE - 1, color: @paints[@id])
    end
  end
end
