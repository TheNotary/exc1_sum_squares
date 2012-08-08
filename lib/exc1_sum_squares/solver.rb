module Exc1SumSquares

  class Solver
    attr_accessor :sums, :min, :max, :matrix
    
    def initialize(input_matrix = [])
      @matrix = input_matrix
      
      calculate_sums
    end
    
    def calculate_sums
      validate_matrix
    end
    
    def validate_matrix
      raise 'Invalid Matrix Error: Lengths' unless is_valid_matrix_size?
      raise 'Invalid Matrix Error: Contents' unless is_valid_matrix_contents?
    end
    
    def is_valid_matrix_contents?
      len = @matrix[0].length
      @matrix.each do |array|
        filtered_array = array.map {|element| element if element.class == Fixnum}.compact
        return false if filtered_array.length < len
      end
      return true
    end
    
    # what do you think of this method name?  Is no arguments cool?
    def is_valid_matrix_size?
      for i in 0...(@matrix.length-1) do
        if @matrix[i].length != @matrix[i+1].length
          return false
        end
      end
      return true
    end
    
    def min
      return @sums.min
    end
    
    def max
      return @sums.max
    end
    
  end

end