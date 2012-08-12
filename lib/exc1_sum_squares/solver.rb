module Exc1SumSquares
  class Solver
    attr_reader :sums, :min, :max, :matrix
    
    def matrix=(val)
      @matrix = val
      calculate_sums
    end
    
    # before_filter :calculate_sums, :only => [:min, :max]
    
    def min
      calculate_sums unless @matrix.empty?
      @sums.min
    end
    
    def max
      calculate_sums unless @matrix.empty?
      @sums.max
    end
    
    def sums
      calculate_sums unless @matrix.empty?
      @sums
    end
    
    def initialize(input_matrix = [])
      @matrix = input_matrix
    end
    
    
    
    def calculate_sums(matrix = @matrix)
      validate_matrix
      
      @sums = choose_the_top_and_bottom_rows_to_calculate
    end
    
    def choose_the_top_and_bottom_rows_to_calculate
      sums = []
      for i in 0...(@matrix.length-1) do
        top_row = @matrix[i]
        bottom_row = @matrix[i+1]
        
        sums = sum_each_square_set_of_the_chosen_rows(top_row, bottom_row, i, sums)
      end
      sums
    end
    
    def sum_each_square_set_of_the_chosen_rows(top_row, bottom_row, i, sums)
      for j in 0...(top_row.length-1) do
        a = top_row[j+0] 
        b = top_row[j+1] 
        c = bottom_row[j+0] 
        d = bottom_row[j+1]
        sums << (a+b+c+d)
      end
      sums
    end
    
    def validate_matrix
      raise 'Invalid Matrix Error: Empty Matrix' if @matrix.empty?
      raise 'Invalid Matrix Error: Lengths' unless is_valid_matrix_size?
      raise 'Invalid Matrix Error: Contents' unless is_valid_matrix_contents?
    end
    
    def is_valid_matrix_contents?
      @matrix.each do |array|
        all_elements_are_numbers = array.all? {|element| element.class == Fixnum}
        return false unless all_elements_are_numbers
      end
      true
    end
    
    # what do you think of this method name?  Is no arguments cool?
    def is_valid_matrix_size?
      for i in 0...(@matrix.length-1) do
        return false if @matrix[i].length != @matrix[i+1].length
      end
      true
    end
    
  end
end