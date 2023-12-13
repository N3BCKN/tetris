require('ruby2d')

WIDTH     = 300
HEIGH     = 600
TILE_SIZE = 30

set width: WIDTH
set heigh: HEIGH
set title: 'tetris'

class Paint
  def initialize
    @palette = [
      '#1a1f28', #grey
      '#FD3F59', #salmon
      '#FFC82E', #orange
      '#FEFB34', #yellow
      '#53DA3F', #green
      '#01EDFA', #cyan
      '#DD0AB2', #purple
      '#EA141C', #red
      '#FE4819', #orange
      '#FF910C', #sandy
      '#0077D3', #dark blue
    ]
  end 

  def [](index)
    @palette[index]
  end
end

class Tetromino
  def initialize(id)
    @id = id
    @cells = []
    @rotation_state = 0
    @paints = Paint.new 
  end

  def draw
    grid = @cells[@rotation_state]
    grid.each do |tile|
      Square.new(x: tile[1] * TILE_SIZE, y: tile[0] * TILE_SIZE, size: TILE_SIZE - 1, color: @paints[@id])
    end
  end
end

class Ltetro < Tetromino
  def initialize
    super(id = 1)
    @cells = 
    [
      [[0,2],[1,0],[1,1],[1,2]],
      [[0,1],[1,1],[2,1],[2,2]],
      [[1,0],[1,1],[1,2],[2,0]],
      [[0,0],[0,1],[1,1],[2,1]]
    ]
  end
end

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

board = Board.new

tetro = Ltetro.new


update do
  clear
  board.draw 
  tetro.draw
end

show 
