require 'ruby2d'

WIDTH = 500
HEIGHT = 1000 
GRID = 50 
BACKGROUND_COLOR = '#000000'

class Tetromino
  attr_accessor :alive
  attr_reader :color, :coordinates

  def initialize 
    @color = random_color
    @coordinates = random_shape
    @alive = true
  end

  def move(speed = 1)
  end

  def rotate
  end

  private
  def random_color
    ['#0341AE', '##72CB3B', '##FFD500', '#FF971C', '#FF3213'].sample 
  end

  def random_shape
    [
      [[2,0],[2,1],[2,2],[2,3]], # I
      [[1,0],[1,1],[2,1],[3,1]], # J 
      [[3,0],[3,1],[2,1],[1,1]], # L 
      [[1,0],[1,1],[2,0],[2,1]], # O
      [[2,0],[3,0],[1,1],[2,1]], # S 
      [[2,0],[1,1],[2,1],[3,1]], # T 
      [[1,0],[2,0],[2,1],[3,1]], # Z
  ].sample
  end 

  def random_position 
  end 
end

class Game
  attr_accessor :tetrominos

  def initialize
    @tetrominos = []
  end

  def draw
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