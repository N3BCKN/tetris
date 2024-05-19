# frozen_string_literal: true

require('ruby2d')

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


update do
  clear
end


show
