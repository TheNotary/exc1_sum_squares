require 'spec_helper'
require 'exc1_sum_squares'


describe Exc1SumSquares::Solver do
  
  before :each do
    @test_array = [ [1, 4, 6, 1, 9],
                    [3, 7, 9, 2, 3],
                    [9, 2, 0, 4, 6],
                    [1, 2, 6, 1, 0] ]
    @solver = Exc1SumSquares::Solver.new @test_array
    @solver.calculate_sums
  end
  
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
    
    its(:sums) {
      @solver.sums.should be_a_kind_of Array
    }
    
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
      @solver.max.should eq(26)
    end
    
    it '.min_slots should contain an array of slots which constitute the minimum of the sums array' do
      @solver.min_slots.should eq [9]
    end
    
    it '.max_slots should be the correct answer' do
      @solver.max_slots.should eq [1]
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
  
  it "shouldn't be capable of outputting inaccurate results" do
    lambda { @solver.sums = [1, 2] }.should raise_error
  end
  
  
  describe 'Validates Matrix Input' do
    it 'rejects misshapen matricies' do
      invalid_matrix = [[1, 2, 3, 4],
                        [1, 2, 3]]
      lambda do
        solver = Exc1SumSquares::Solver.new invalid_matrix
        solver.validate_matrix
      end.should raise_error Exc1SumSquares::Solver::InvalidMatrix
    end
    
    it 'rejects matricies that contain non-numbers' do
      invalid_matrix = [[1, 2, 3, 4],
                        [1, 2, 3, "a"]]
      lambda do
        solver = Exc1SumSquares::Solver.new invalid_matrix
        solver.validate_matrix
      end.should raise_error Exc1SumSquares::Solver::InvalidMatrix
    end
  end
  
  
  
end