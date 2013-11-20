class Grid
  attr_reader :board, :rows, :columns, :boxes

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

  def initialize(board)
    validate board
    @board = board
    create_rows
    create_columns
    create_boxes
  end

  def create_rows
    @rows = []
    rows = self.board.scan(/.{9}/)
    rows.each { |row| @rows << Row.new(self, row) }
  end

  def create_columns
    @columns = []
    columns = Array.new(9) { '' }
    0.upto(80) do |cell_num|
      column_num = cell_num % 9
      columns[column_num] += self.board[cell_num]
    end
    columns.each { |column| @columns << Column.new(self, column) }
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
    boxes.each { |box| @boxes << Box.new(self, box) }
  end

  def is_solved?
    !self.board.include?('0')
  end

  private
  def validate(board)
    raise ArgumentError, "Must be 81 characters long" unless board.length == 81
  end

end

