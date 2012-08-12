module Exc1SumSquares

  class Solver
    attr_accessor :sums, :min, :max, :matrix
    
    def initialize(input_matrix = [])
      @matrix = input_matrix
      @sums = []
      
      calculate_sums unless input_matrix == []
    end
    
    def calculate_sums(matrix = @matrix)
      validate_matrix
      
      for i in 0..(@matrix.length-1) do
        top_row = @matrix[i]
        bottom_row = @matrix[i+1]
        
        for j in 0..(top_row.length-1) do
          #require 'pry'; binding.pry
          require 'ruby-debug';debugger
          a = top_row[j+0] 
          b = top_row[j+1] 
          c = bottom_row[j+0] 
          d = bottom_row[j+1]
          @sums << (a+b+c+d)
        end
      end
      
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