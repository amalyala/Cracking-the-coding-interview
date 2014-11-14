# Finding the location of a given string which is interspersed with empty strings.
# For this problem we take example from book itself.
require 'colorize'

class EmptyStrings
 def initialize
  @array = [nil,nil,"dfd",nil,nil,"rahul",nil,nil,"ffd",nil,nil]  # Example from the book.
  puts "\nYour array is #{@array}".cyan
  puts "Enter the string to search".yellow
  @search = gets.chomp
  # Check condition
  if @search.size == 0
   puts "Nothing to find".red
   return
  end
  @start = 0
  @end = @array.size-1
  startSearching # Call this method to start the searching.
 end

 # This method has the logic to search our given string.
 # Search is simple implementation of binary search but with modification.
 def startSearching
  # Base condition for recursive calls
  if @end - @start == 1
   if @array[@start] == @search
    puts "Found string #{@search} at position #{@start} in sorted array".green
    return
   elsif @array[@end] == @search
    puts "Found string #{@search} at position #{@end} in sorted array".green
    return
   else
    puts "String #{@search} not found".red
    return    
   end 
  end  
  # First lets check if all the elements in array are nil or not.
  while @start <= @end and @array[@end] == nil
   @end -= 1
  end
  if @end < @start
   puts "All the values in array are nil".red
   return
  end
  @middle = (@start + @end)/2 # Getting the pivot
  while @array[@middle] == nil # If pivot is nil, move next.
    @middle += 1
  end
  value = @array[@middle] <=> @search
  if value == 0
   puts "String '#{@search}' found at position #{@middle}"
   return 
  elsif value < 0
   @start = @middle + 1 
   startSearching # Recursive call	
  elsif value > 0
   @end = @middle + 1
   startSearching # Recursive call
  end
 end
end

@obj = EmptyStrings.new
