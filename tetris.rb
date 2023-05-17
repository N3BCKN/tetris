require 'ruby2d'

WIDTH = 500
HEIGHT = 1000 
GRID = 50 
BACKGROUND_COLOR = '#000000'

class Tetromino
  attr_accessor :alive, :coordinates
  attr_reader :color

  def initialize 
    @color = random_color
    @coordinates = random_shape
    adjust_possition
    @alive = true
  end

  private
  def random_color
    ['#0341AE', '#72CB3B', '#FFD500', '#FF971C', '#FF3213'].sample 
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

  def adjust_possition 
    x_multiplier = rand(-1..2)
    @coordinates.map! {|cord| [cord[0] + x_multiplier, cord[1]]}
  end 
end

class Game
  attr_accessor :tetrominos

  def initialize
    @tetrominos = []
    generate_tetromino
  end

  def draw
    @tetrominos.each do |tetromino|
      4.times do |n|
        Square.new(x: tetromino.coordinates[n][0] * GRID  ,y: tetromino.coordinates[n][1] * GRID ,size: GRID - 1,color: tetromino.color)
      end 
    end
  end

  def move(direction)
    coordinates = @tetrominos.last.coordinates.clone
    case direction
    when 'down'
      coordinates.map! {|cord| [cord[0], cord[1]+1]}
    when 'left'
      coordinates.map! {|cord| [cord[0] - 1, cord[1]]}
    when 'right'
      coordinates.map! {|cord| [cord[0] + 1, cord[1]]}
    end
    
    @tetrominos.last.coordinates = coordinates unless hit_wall?(coordinates)
  end

  private 
  def generate_tetromino
    @tetrominos << Tetromino.new
  end

  def hit_wall?(coordinates)
    coordinates.any? {|cord| cord[0] < 0 || cord[0] > 9}
  end 
end



set width: WIDTH
set height: HEIGHT
set color: BACKGROUND_COLOR
set title: 'tetris'


game = Game.new 

update do 
  clear 

  game.draw
  
end 

on :key_down do |event|
  game.move(event.key) if ['down','left','right'].include? event.key
end


show