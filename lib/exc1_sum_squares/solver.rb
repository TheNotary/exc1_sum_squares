module Exc1SumSquares
  class Solver
    class InvalidMatrix < StandardError; end
    
    attr_reader :sums, :min, :max, :matrix, :min_slots, :max_slots
    
    def matrix=(val)
      @matrix = val
      calculate_sums
    end
    
    def min
      calculate_sums unless @matrix.empty?
      @min
    end
    
    def max
      calculate_sums unless @matrix.empty?
      @max
    end
    
    def sums
      calculate_sums unless @matrix.empty?
      @sums
    end
    
    def initialize(input_matrix = [])
      @matrix = input_matrix
    end
    
    # Find out which slots of the sums array count as minimum slots
    def calculate_min_slots(matrix)
      output = []
      @sums.each.with_index do |e, i|
        if e == @min
          output << i
        end
      end
      #require 'pry';binding.pry
      output
    end
    
    # Find out which slots of the sums array count as maximum slots
    def calculate_max_slots(matrix)
      output = []
      @sums.each.with_index do |e, i|
        if e == @max
          output << i
        end
      end
      output
    end
    
    
    def calculate_sums(matrix = @matrix)
      validate_matrix
      
      @sums = choose_the_top_and_bottom_rows_to_calculate(@matrix)
      @min = @sums.min
      @max = @sums.max
      @min_slots = calculate_min_slots(@matrix)
      @max_slots = calculate_max_slots(@matrix)
    end
    
    
    def choose_the_top_and_bottom_rows_to_calculate(matrix)
      sums = []
      for i in 0...(matrix.length-1) do
        top_row = matrix[i]
        bottom_row = matrix[i+1]
        
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
      raise InvalidMatrix if @matrix.empty?  #'Invalid Matrix Error: Empty Matrix'
      raise InvalidMatrix unless is_valid_matrix_size? #'Invalid Matrix Error: Lengths' 
      raise InvalidMatrix unless is_valid_matrix_contents? #'Invalid Matrix Error: Contents' 
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