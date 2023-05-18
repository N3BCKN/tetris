require 'ruby2d'
require 'debug'

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
    @alive = true
    adjust_possition
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
    x_multiplier = rand(-1..5)
    @coordinates.map! {|cord| [cord[0] + x_multiplier, cord[1]]}
  end 
end

class Game
  attr_accessor :tetrominos

  def initialize
    @tetrominos = []
    @timer = Time.now.strftime('%s%L').to_i
    generate_tetromino
  end

  def draw
    @tetrominos.each do |tetromino|
      4.times do |n|
        Square.new(x: tetromino.coordinates[n][0] * GRID  ,y: tetromino.coordinates[n][1] * GRID ,size: GRID - 1,color: tetromino.color)
      end 
    end
  end

  def move_down
    coordinates = current_tetromino.coordinates.clone
    coordinates.map! {|cord| [cord[0], cord[1] + 1]}

    current_tetromino.coordinates = coordinates unless will_hit_bottom?(coordinates)
  end

  def move_horizontal(direction)
    mover = (direction == 'right') ? 1 : -1
    coordinates = current_tetromino.coordinates.clone

    coordinates.map! {|cord| [cord[0] + mover, cord[1]]}
    current_tetromino.coordinates = coordinates unless will_hit_wall?(coordinates) || will_hit_other_tetromino?(coordinates)
  end

  def tick 
    current_time = Time.now.strftime('%s%L').to_i

    if current_time - @timer >= 1000 
      @timer = current_time
      move_down
    end
  end

  private 
  def generate_tetromino
    @tetrominos << Tetromino.new
  end

  def will_hit_wall?(new_coordinates)
    new_coordinates.any? {|cord| cord[0] < 0 || cord[0] > 9}
  end 

  def will_hit_bottom?(new_coordinates)
    if current_tetromino.coordinates.any? {|cord| cord[1] == 19} || will_hit_other_tetromino?(new_coordinates)
      current_tetromino.alive = false 
      generate_tetromino
      return true
    end
    false
  end

  def will_hit_other_tetromino?(new_coordinates)
    other_tetrominos_coordinates.each do |other_coordinates|
      return true if (new_coordinates & other_coordinates).any?
    end
    false
  end

  def current_tetromino
    @tetrominos.last
  end 

  def other_tetrominos_coordinates
    @tetrominos[0,@tetrominos.size-1].map(&:coordinates)
  end
end

set width: WIDTH
set height: HEIGHT
set color: BACKGROUND_COLOR
set fps_cap: 10
set title: 'tetris'

game = Game.new 

update do 
  clear 
  game.draw
  game.tick
end 

on :key_down do |event|
  if ['left','right'].include?(event.key)
    game.move_horizontal(event.key)
  elsif event.key == 'down'
    game.move_down
  end
end


show