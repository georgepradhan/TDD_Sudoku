require_relative 'grid'
require_relative 'element'
require_relative 'row'
require_relative 'column'
require_relative 'box'

puzzle = Grid.new('530070000600195000098000060800060003400803001700020006060000280000419005000080079')


p puzzle.board
Solver.solve!(puzzle)
p puzzle.board