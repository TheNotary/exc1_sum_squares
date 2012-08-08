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
    @solver = Exc1SumSquares::Solver.new @test_array
  end
  
  it 'should be able to make an object and it should be the right type' do
    @solver = Exc1SumSquares::Solver.new @test_array
    
    @solver.should be_an_instance_of(Exc1SumSquares::Solver)
  end
  
  
  it 'should have the input matrix exposed' do
    @solver.should respond_to(:matrix)
    @solver.matrix.should be @test_array
  end
  
  it 'should respond to .sums which consists of all summed squares' do
    @solver.should respond_to(:sums)
  end
  
  
  it 'responds to .min' do
    @solver.should respond_to(:min)
  end
  
  it 'responds to .max' do
    @solver.should respond_to(:max)
  end
  
  describe 'Validates Matrix Input' do
    it 'rejects invalid matricies' do
      invalid_matrix = [[1, 2, 3, 4],
                        [1, 2, 3]]
      lambda do
        solver = Exc1SumSquares::Solver.new invalid_matrix
      end.should raise_error 'Invalid Matrix Error: Lengths'
    end
    
    it 'rejects matricies that contain non-numbers' do
      invalid_matrix = [[1, 2, 3, 4],
                        [1, 2, 3, "a"]]
      lambda do
        solver = Exc1SumSquares::Solver.new invalid_matrix
      end.should raise_error 'Invalid Matrix Error: Contents'
    end
  end
  
  
  
end