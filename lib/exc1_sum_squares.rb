# You place you code within modules.  To call a function from within a module, it looks like this...
#  Exc1SumSquares::hello();
require 'exc1_sum_squares/solver.rb'

module Exc1SumSquares
  
  def self.hello
    return "Hello world of gems"
  end
  
  def self.check_sum(input)
    return input
  end
end
