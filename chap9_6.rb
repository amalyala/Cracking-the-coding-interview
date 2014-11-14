# A matrix in which each row and each column is sorted, write a method to find an element in it.
# In this example, lets take a hard coded sorted matrix. 
# Please change your matrix as required. But NOTE to have sorted matrix only.
require 'colorize'

class MatrixSortedSearch
  attr_accessor :array
  def initialize
   @array = [[1,2,3,10,18],[4,5,6,13,21],[7,8,9,14,23],[11,12,15,17,26],[15,19,22,24,30]]
   @row = @array.size-1
   @col = 0
   puts "Below is your matrix".yellow
   p @array
   askUserElement # Method call
  end
  
  # This method is called to ask user which element to search
  def askUserElement
   puts "\nEnter number to find".yellow
   @find = gets.chomp
   # Test if user has entered number itself.
   if @find.match(/^(\d)+$/) 
    @find = @find.to_i
    startSearching # Method call to search
   else 
    puts "Invalid entry".red
    return
   end
  end
  
  # Method to search the element in matrix.
  def startSearching
   # We will start comparing from the last element of array-
   # i.e. the right most top element in matrix.
   while @col <= @array.size-1 and @row > 0
    if @array[@row][@col] == @find
     puts "-------------------------------------------------------------------- ".green
     puts "Found the element #{@find} at position Row * Col = [#{@row}][#{@col}]".green
     puts "-------------------------------------------------------------------- ".green
     return
    elsif @find < @array[@row][@col]
     @row -= 1 # move left to array
    elsif @find > @array[@row][@col]
     @col += 1 # move left to array
    end
  end 
  puts "Number #{@find} not found".red
end
end

 @obj = MatrixSortedSearch.new()
 
