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

class Board
  attr_accessor :grid

  def initialize
    @grid  = Array.new(WIDTH / TILE_SIZE).fill(Array.new(HEIGH / TILE_SIZE).fill(0))
    @paint = Paint.new
  end

  def draw
    @grid.each_with_index do |row, i|
      row.each_with_index do |val, j|
        Square.new(x: i * TILE_SIZE, y: j * TILE_SIZE , size: TILE_SIZE - 1, color: @paint[val])
      end
    end 
  end
end 

board = Board.new


update do
  clear
  board.draw 
end

show 
