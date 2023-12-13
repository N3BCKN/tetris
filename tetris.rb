require('ruby2d')

WIDTH     = 300
HEIGH     = 600
TILE_SIZE = 30

set width: WIDTH
set heigh: HEIGH
set title: 'tetris'


class Color

end

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(WIDTH / TILE_SIZE).fill(Array.new(HEIGH / TILE_SIZE).fill(0))
  end

  def draw
    @grid.each_with_index do |row, i|
      row.each_with_index do |_, j|
        Square.new(x: i * TILE_SIZE, y: j * TILE_SIZE , size: TILE_SIZE - 1, color: '#25d600')
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
