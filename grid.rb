class Grid
  attr_reader :board

  def initialize(board)
    validate(board)
    @board = board
    create_rows
    create_columns
    create_boxes
  end

  def create_rows
    rows = self.board.scan(/.{9}/)
    rows.each { |row| Row.new(self, row) }
  end

  def create_columns
  end

  def create_boxes
  end

  private
  def validate(board)
    raise ArgumentError, "Must be 81 characters long" unless board.length == 81
  end

end

