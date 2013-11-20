class Element
  attr_reader :board, :numbers

  def initialize(board, numbers)
    @board = board
    @numbers = numbers    
  end

  def is_solved?
    !self.numbers.include?('0')
  end

  def is_solvable?
    self.numbers.count('0') == 1
  end

  def sum
    self.numbers.reduce(:+)
  end
end