# You place you code within modules.  To call a function from within a module, it looks like this...
#  Exc1SumSquares::hello();
require 'exc1_sum_squares/solver.rb'
require 'yaml'

module Exc1SumSquares
  
  def self.hello
    return "Hello world of gems"
  end
  
  def self.solve(input)
    array = input
    array.gsub!(/(\,)(\S)/, "\\1 \\2")
    array = YAML::load(input)
    

    s = Exc1SumSquares::Solver.new array
    
    output = "Min: #{s.min}\nMax: #{s.max}"
    puts output
    return output
  end
end
