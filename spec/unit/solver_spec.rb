require './spec/spec_helper'

require './lib/exc1_sum_squares.rb'


describe Exc1SumSquares do
  it 'should say hello' do
    Exc1SumSquares::hello.should == "Hello world of gems"
  end
end


describe Exc1SumSquares::Solver do
  
  before :each do
    @test_array = [ [1, 4, 6, 1, 9],
                    [3, 7, 9, 2, 3],
                    [9, 2, 0, 4, 6],
                    [1, 2, 6, 1, 0] ]
  end
  
  it 'should be able to make an object and it should be the right type' do
    @solver = new Exc1SumSquares::Solver(@test_array)
  end
  
  
  
  
  it 'should respond to .sums and it should be an array' do
    @solver.should respond_to(:sums)
  end
  
  
  it 'should solve for the minimum square sums' do
    
    
    # solver.sums
    # solver.min
  end
end