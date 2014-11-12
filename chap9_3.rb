# This program is to find an element in rotated array in O(log n).
# We use a modified binary search to achieve this.
require 'colorize'

class RotatedArray
 def initialize(size)
  # Generating random numbers between 1 to 500.
  # Then we sort it.
  @array = (1..size.to_i).map do 
    rand(500) 
  end
  @array = @array.sort
  puts "Your sorted array is".yellow
  p @array
  rotatingArray # Method to rotate array
 end
 
 # This method rotates given array "random" number of times.
 def rotatingArray
  puts "\n Rotating array random number of times ...\n".cyan
  sleep 2
  @rotated_array = @array.rotate(rand(10)) # Rotates array random number of times.
  findElement # Calling this method to ask user
 end
 
 # This method asks user to tell which element to find from array
 def findElement
  puts "Please enter your number to find"
  @element = gets.chomp
  findElement # Method called.
 end
 
 # This method has the logic for findig element in O(log n)
 def findElement
  # First we have to find the starting element after random rotations.
  # Here, when a sorted array is rotated, we can see that one element has prev and next element greater than
  # an element. That element is the starting element. Example '4' in this array: ['12','13','15','4','5','6','7'].
  findingPivot # Method to find starting element.
  modifiedBinarySearch # This method gives us output.  
 end
 
 # This method is called to find out which is the starting element after rotations.
 def findingPivot
 end
 
 end
 
 
 def modifiedBinarySearch
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
