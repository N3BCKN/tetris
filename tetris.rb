require 'ruby2d'

WIDTH = 500
HEIGHT = 1000 
GRID = 50 
BACKGROUND_COLOR = '#000000'

class Tetromino
end

class Game
  attr_accessor :tetrominos

  def initialize
    @tetrominos = []
    generate_tetromino
  end

  private 
  def generate_tetromino
    @tetrominos << Tetromino.new
  end
end

game = Game.new 

set width: WIDTH
set height: HEIGHT
set color: BACKGROUND_COLOR
set title: 'tetris'

show