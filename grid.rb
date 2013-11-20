class Grid
  attr_reader :board, :rows, :columns, :boxes, :cells

  def initialize(board)
    validate board
    @board = board
    create_rows
    create_columns
    create_boxes
    create_cells 
  end

  def create_rows
    @rows = []
    rows = self.board.scan(/.{9}/)
    rows.each { |row| @rows << Row.new(row) }
  end

  def create_columns
    @columns = []
    columns = Array.new(9) { '' }
    0.upto(80) do |cell_num|
      column_num = cell_num % 9
      columns[column_num] += self.board[cell_num]
    end
    columns.each { |column| @columns << Column.new(column) }
  end

  def create_boxes
    @boxes = []
    boxes = Array.new(9) { '' }
    0.upto(80) do |cell_num|
      super_column_num = (cell_num % 9) / 3
      super_row_num = (cell_num / 9) / 3
      box_num = SUPER_ROW_COLUMN_BOXES[[super_row_num, super_column_num]]
      boxes[box_num] += self.board[cell_num]
    end
    boxes.each { |box| @boxes << Box.new(box) }
  end

  def create_cells
    @cells = []
    board.split('').each { |num| @cells << Cell.new(self, num) }
  end

  def is_solved?
    !self.cells.map(&:number).include?('0')
  end

  private
  def validate(board)
    raise ArgumentError, "Must be 81 characters long" unless board.length == 81
  end

end

class Solver
  class << self
    def solve!(grid)
      until grid.is_solved?
        grid.attempt_to_solve
      end
    end
  end
end


