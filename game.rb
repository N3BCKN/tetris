class Game
  def initialize
    @board = Board.new
    @tetrominos = generate_tetrominos
    @current_tetromino = random_tetromino
    @next_tetromino = random_tetromino
  end 

  def random_tetromino
    @tetrominos = generate_tetrominos if @tetrominos.empty? 
    @tetrominos.delete(@tetrominos.sample)
  end

  def move_left
    @current_tetromino.move(-1,0) if @current_tetromino.will_fit?(-1,0)
  end 

  def move_right
    @current_tetromino.move(1,0) if @current_tetromino.will_fit?(1,0)
  end 

  def move_down
    @current_tetromino.move(0,1) if @current_tetromino.will_fit?(0,1)
  end

  def rotate_tetromino
    @current_tetromino.rotate 

    @current_tetromino.undo_rotation unless @current_tetromino.is_inside?
  end

  def draw
    @board.draw
    @current_tetromino.draw
  end

  private 
  def generate_tetrominos
    [Ltetro.new, Jtetro.new, Itetro.new, Otetro.new, Stetro.new, Ttetro.new, Ztetro.new]
  end

  # def tetromino_fits?(col, row)
  #   @current_tetromino.cells_position.all? {|cell| (0..15).include?(cell[0] + row) && (0..9).include?(cell[1] + col) }
  # end
end
