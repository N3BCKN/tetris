require('ruby2d')

require_relative('./paint')
require_relative('./board')
require_relative('./tetromino')
require_relative('./tetrominos')
require_relative('./game')

WIDTH      = 300
HEIGHT     = 600
TILE_SIZE  = 30

set width: WIDTH
set height: HEIGHT
set fps_cap: 30
set title: 'tetris'

game = Game.new

update do
  clear
  game.draw

  game.move_down if Window.frames % 30 == 0 
end

on :key_down do |event|
  case event.key
  when 'left'
    game.move_left
  when 'right'
    game.move_right
  when 'up'
    game.rotate_tetromino
  end
end

on :key_held do |event|
  game.move_down if event.key == 'down'
end

show 
