# frozen_string_literal: true

require_relative('./paint')
require_relative('./board')
require_relative('./tetromino')
require_relative('./tetrominos')
require_relative('./interface')

class Game
  attr_accessor :paused, :game_over

  def initialize
    @board = Board.new
    @interface = Interface.new
    @tetrominos = generate_tetrominos
    @current_tetromino = random_tetromino
    @next_tetromino = random_tetromino
    @game_over = false
    @paused = false
    @score = 0
  end

  def move_left
    @current_tetromino.move(-1, 0) if tetromino_will_fit?(-1, 0)
  end

  def move_right
    @current_tetromino.move(1, 0) if tetromino_will_fit?(1, 0)
  end

  def move_down
    @current_tetromino.move(0, 1) if tetromino_will_fit?(0, 1)

    # check if any next moves toward this dirrection are still possible
    return if tetromino_will_fit?(0, 1)

    lock_tetromino
    rows_cleaned = @board.clean_full_rows
    update_score(rows_cleaned)
  end

  def rotate_tetromino
    @current_tetromino.rotate
    @current_tetromino.undo_rotation unless tetromino_is_inside?
  end

  def pause
    @paused = !@paused
  end

  def draw
    @board.draw
    @current_tetromino.draw

    @interface.draw_score(@score)
    @interface.draw_next_tetromino(@next_tetromino)

    Interface.draw_pause_message unless @paused
  end

  private

  def tetromino_is_inside?
    @current_tetromino.cells_position.all? { |cell| (0..19).include?(cell[0]) && (0..9).include?(cell[1]) }
  end

  def tetromino_will_fit?(col, row)
    inside_board = @current_tetromino.cells_position.all? do |cell|
      (0..19).include?(cell[0] + row) && (0..9).include?(cell[1] + col)
    end

    return false unless inside_board

    not_touching_others = @current_tetromino.cells_position.all? do |cell|
      (@board[[cell[0] + row, cell[1] + col]]).zero?
    end

    inside_board && not_touching_others
  end

  def random_tetromino
    @tetrominos = generate_tetrominos if @tetrominos.empty?
    @tetrominos.delete(@tetrominos.sample)
  end

  def generate_tetrominos
    [Ltetro.new, Jtetro.new, Itetro.new, Otetro.new, Stetro.new, Ttetro.new, Ztetro.new]
  end

  def lock_tetromino
    @current_tetromino.cells_position.each do |cell|
      @board[[cell[0], cell[1]]] = @current_tetromino.id
    end

    @current_tetromino = @next_tetromino
    @next_tetromino = random_tetromino

    @game_over = true unless tetromino_will_fit?(0, 0)
  end

  def update_score(rows_cleaned)
    if rows_cleaned == 1
      @score += 100
    elsif rows_cleaned == 2
      @score += 350
    elsif rows_cleaned == 3
      @score += 600
    elsif rows_cleaned >= 0
      @score += rows_cleaned * 350
    end
  end
end
