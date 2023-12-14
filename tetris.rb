require('ruby2d')

require_relative('./paint')
require_relative('./board')
require_relative('./tetromino')
require_relative('./tetrominos')
require_relative('./interface')
require_relative('./game')

WIDTH      = 300
HEIGHT     = 600
INTERFACE_WIDTH = 200
INTERFACE_HEIGHT = 20 
TILE_SIZE  = 30

set width: WIDTH + INTERFACE_WIDTH
set height: HEIGHT + INTERFACE_HEIGHT
set fps_cap: 30
set background: '#0c5194'
set title: 'tetris'

game = Game.new

update do
  clear
  game.draw

  if game.paused
    Interface.draw_pause_message('game paused')
    next
  end

  if game.game_over
    Interface.draw_game_over
    next
  end

  game.move_down if Window.frames % 30 == 0 
end

on :key_down do |event|
  game.pause if event.key == 'escape' && !game.game_over

  unless game.paused || game.game_over
    case event.key
    when 'left'
      game.move_left
    when 'right'
      game.move_right
    when 'up'
      game.rotate_tetromino
    end
  end 
end

on :key_held do |event|
  game.move_down if event.key == 'down' && !game.game_over && !game.paused
end

show 
