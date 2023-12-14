class Ltetro < Tetromino
  def initialize
    super(id = 1)
    @cells = 
    [
      [[0,2],[1,0],[1,1],[1,2]],
      [[0,1],[1,1],[2,1],[2,2]],
      [[1,0],[1,1],[1,2],[2,0]],
      [[0,0],[0,1],[1,1],[2,1]]
    ]
    move(3, 0)
  end
end

class Jtetro < Tetromino
  def initialize
    super(id = 2)
    @cells = 
    [
      [[0,0],[1,0],[1,1],[1,2]],
      [[0,1],[0,2],[1,1],[2,1]],
      [[1,0],[1,1],[1,2],[2,2]],
      [[0,1],[1,1],[2,0],[2,1]]
    ]
  end
end

class Itetro < Tetromino
  def initialize
    super(id = 3)
    @cells = 
    [
      [[1, 0], [1, 1], [1, 2], [1, 3]],
      [[0, 2], [1, 2], [2, 2], [3, 2]],
      [[2, 0], [2, 1], [2, 2], [2, 3]],
      [[0, 1], [1, 1], [2, 1], [3, 1]]
    ]
  end
end

class Otetro < Tetromino
  def initialize
    super(id = 4)
    @cells = 
    [
      [[0,0],[0,1],[1,0],[1,1]]
    ]
  end
end

class Stetro < Tetromino
  def initialize
    super(id = 5)
    @cells = 
    [
        [[0, 1], [0, 2], [1, 0], [1, 1]],
        [[0, 1], [1, 1], [1, 2], [2, 2]],
        [[1, 1], [1, 2], [2, 0], [2, 1]],
        [[0, 0], [1, 0], [1, 1], [2, 1]]  
    ]
  end
end

class Ttetro < Tetromino
  def initialize
    super(id = 6)
    @cells = 
    [
      [[0, 1], [1, 0], [1, 1], [1, 2]],
      [[0, 1], [1, 1], [1, 2], [2, 1]],
      [[1, 0], [1, 1], [1, 2], [2, 1]],
      [[0, 1], [1, 0], [1, 1], [2, 1]]
    ]
  end
end

class Ztetro < Tetromino
  def initialize
    super(id = 7)
    @cells = 
    [
      [[0, 0], [0, 1], [1, 1], [1, 2]],
      [[0, 2], [1, 1], [1, 2], [2, 1]],
      [[1, 0], [1, 1], [2, 1], [2, 2]],
      [[0, 1], [1, 0], [1, 1], [2, 0]]
    ]
  end
end
