class Row
  attr_reader :board, :numbers

  def initialize(board, numbers)
    @board = board
    @numbers = numbers    
  end

  def is_solved?
    self.numbers.include?(0)
  end

end