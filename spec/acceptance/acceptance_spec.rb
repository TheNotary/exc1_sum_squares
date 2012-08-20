require 'spec_helper'
require 'exc1_sum_squares'

describe Exc1SumSquares do
  it 'should solve a problem' do
    output = Exc1SumSquares::solve('[ [1, 2, 3, 4], [5, 6, 7, 8] ]')
    output.min.should be 14
    output.max.should be 22
  end
end
