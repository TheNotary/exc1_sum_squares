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
  #let(:solver) { Exc1SumSquares::Solver.new @test_array }
  
  describe @solver do
    it 'should be able to make an object and it should be the right type' do
      should be_an_instance_of(Exc1SumSquares::Solver)
    end
    
    it { should respond_to(:min, :max) }
    
    it 'should respond to .sums which consists of all summed squares' do
      should respond_to(:sums)
    end
    
    it 'should have the input matrix exposed' do
      should respond_to(:matrix)
      @solver.matrix.should be @test_array
    end
    
    its(:sums) { should be_a_kind_of Array }
    
    it '.sums contains correct sums' do
      @solver.sums[0].should be 15
      @solver.sums[4].should be 21
      @solver.sums[9].should be 10
    end
    
    it '.min should be the correct answer' do
      @solver.min.should be @solver.sums.min
      @solver.min.should be 10
    end
    
    it '.max should be the correct answer' do
      @solver.max.should be @solver.sums.max
      @solver.max.should be 26
    end
    
  end
  
  
  
  
  
  
  
  
  it 'should work for large arrays', :current => true do    # tagging this test current allows you to single out the test on the command line with '$  rspec --tag current'
    array = [ [1, 4, 6, 1, 9,2000],
              [3, 7, 9, 2, 3,2],
              [9, 2, 0, 4, 6,0],
              [1, 2, 6, 1, 0,0],
              [1, 2, 6, 1, 0,1] ]
    solver = Exc1SumSquares::Solver.new array
    
    solver.min.should be 1
    solver.max.should be 2014
  end
  
  it 'can take an array late' do
    solver = Exc1SumSquares::Solver.new
    solver.matrix = @test_array
    
    solver.min.should be 10
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