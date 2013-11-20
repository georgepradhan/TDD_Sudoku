class Grid
  attr_reader :board, :rows, :columns, :boxes

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
  end

  private
  def validate(board)
    raise ArgumentError, "Must be 81 characters long" unless board.length == 81
  end

end

