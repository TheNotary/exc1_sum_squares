# You place you code within modules.  To call a function from within a module, it looks like this...
#  Exc1SumSquares::hello();
require 'exc1_sum_squares/solver'
require 'yaml'

module Exc1SumSquares
  def self.solve(input)
    s = Exc1SumSquares::Solver.new input
    
    return s
  end
  
  def self.help
    puts "This is a CLI app that solves something for you... use it like this..."
    puts "$  exc1_sum_squares '[[1, 2, 3, 4], [5, 6, 7, 8]]'"
  end
end
