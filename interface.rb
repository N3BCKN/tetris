class Interface
  def initialize
    @paint = Paint.new
  end

  def draw_score(score = 0)
    Text.new('SCORE', x: WIDTH + 45, y: 20 , size: 30)
    Rectangle.new(x: WIDTH + 30, y: 65, width: 140, height: 35, color: '#65a9eb')
    Text.new(score, x: WIDTH + 85, y: 60 , size: 30)
  end 

  def draw_next_tetromino(tetromino)
    Text.new('NEXT', x: WIDTH + 55, y: 150 , size: 30)
    Rectangle.new(x: WIDTH + 30, y: 190, width: 140, height: 200, color: '#65a9eb')
    
    tetromino.cells_position.each do |cell|
      Square.new(x: cell[0] * TILE_SIZE + WIDTH + 50, y: cell[1] * TILE_SIZE + 200, size: TILE_SIZE, color: @paint[tetromino.id])
    end
  end

  def draw_message(message = 'press ESC to pause', color = 'white')
    Text.new(message, x: WIDTH + 15, y: 450 , size: 20)
  end
end
