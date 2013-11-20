class Cell
  attr_reader :grid
  attr_accessor :number

  SUPER_ROW_COLUMN_BOXES = {
    [0,0] => 0,
    [0,1] => 1,
    [0,2] => 2,
    [1,0] => 3,
    [1,1] => 4,
    [1,2] => 5,
    [2,0] => 6,
    [2,1] => 7,
    [2,2] => 8
  }
  
  def initialize(grid, number)
    @grid = grid
    @number = number
  end

  def row_num
    self.number / 9
  end

  def row
    grid.rows[row_num]
  end

  def column_num
    self.number % 9
  end

  def column
    grid.columns[column_num]
  end

  def box_num
    super_row_num = row_num / 3
    super_column_num = column_num / 3    
    SUPER_ROW_COLUMN_BOXES[[super_row_num, super_column_num]]
  end

  def box
    grid.boxes[box_num]
  end

  def unique_neighbors
    ( row.numbers.split('') + 
      column.numbers.split('') + 
      box.numbers.split('') ).uniq
  end

  def sum_of_neighbors
    unique_neighbors.map(&:to_i).reduce(:+)
  end

  def is_solvable?
    number == 0 && unique_neighbors.count == 9
  end

  def solve!
    number = (1..9).reduce(:+) - sum_of_neighbors
  end
end