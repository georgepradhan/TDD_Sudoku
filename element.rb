class Element
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers    
  end

  def sum
    self.numbers.split('').map(&:to_i).reduce(:+)
  end
end