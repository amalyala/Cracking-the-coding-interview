# This program is to find an element in rotated array in O(log n).
# We use a modified binary search to achieve this.
require 'colorize'

class RotatedArray
 def initialize(size)
  # Generating random numbers between 1 to 1000.
  # Then we sort it.
  @array = (1..size.to_i).map do 
    rand(1000) 
  end
  @size = @array.size-1
  @array = @array.sort
  puts "Your sorted array is".yellow
  p @array
  rotatingArray # Method to rotate array
 end
 
 # This method rotates given array "random" number of times.
 def rotatingArray
  puts "\n Rotating array random number of times ...\n".cyan
  sleep 1
  @rotated_array = @array.rotate(rand(10)) # Rotates array random number of times.
  findElement # Calling this method to ask user
 end
 
 # This method asks user to tell which element to find from array
 def findElement
  puts "Please enter your number to find".cyan
  @element = gets.chomp.to_i
  searchStart # Method called.
 end
 
 # This method has the logic for findig element in O(log n)
 def searchStart
  # First we have to find the starting element after random rotations.
  # Logic: Here, when a sorted array is rotated, we can see that only one element has prev and next element greater than-
  # an element. That particular element is the starting element. Example '4' in this array: ['12','13','15','4','5','6','7'].
  findingPivot # Method to find starting element.
  modifiedBinarySearch # This method gives us output.  
 end
 
 # This method is called to find out which is the starting element after rotations.
 def findingPivot
  @rotated_array.each_with_index do |element,index|
   if index == 0 or index == @rotated_array.size-1
    next # Skip the iterating if its either first or the last element of array.
   end
   if element > @rotated_array[index-1] and element > @rotated_array[index+1]
     @number_of_rotations = index+1
     puts "This array is rotated #{@number_of_rotations} number of times.".yellow
     return
   end
  end
    modifiedBinarySearch # calling modified binary search.
 end

 def modifiedBinarySearch
  if @rotated_array[@number_of_rotations] == @element
   puts "Found value at position #{@number_of_rotations}".green
   p @rotated_array
   return
  elsif @element > @rotated_array[0]
   performingSorting(0,@number_of_rotations) # Perform binary Search only for first half.
  elsif @element < @rotated_array[0] 
   performingSorting(@number_of_rotations,@size) # Perform binary Search only for second half.
  end  
 end
 
 # Performing modified binary search.
 def performingSorting(head,tail)
  middle = (head + tail) / 2    
  if @rotated_array[middle] == @element
   puts "---------------------------------------------------------".green
   puts "Found element #{@element} at position #{middle} in array".green
   p @rotated_array
   puts "---------------------------------------------------------".green
   return
  elsif @rotated_array[middle] < @element
   head = middle
   performingSorting(head,tail) # Recursive call
  elsif @array[middle] > @element 
   tail = middle
   performingSorting(head,tail) # Recursive call
  end
 end
 
end

 puts "Enter the size of Array"
 size = gets.chomp
 # Checking if entry is a valid integer or not.
 if size.match(/^(\d)+$/) 
  @obj = RotatedArray.new(size)
 else
  puts "Invalid Entry".red
 end
