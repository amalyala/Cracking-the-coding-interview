# This program is to implement a First In First Out procedure for animal shelter-
# holding only Cats and Dogs described in chapter 3, 7 question.
require 'colorize'

class AnimalShelter

 def initialize
  @shelter = Array.new # Creating Linked List.
  @buffer = Array.new # This array acts as buffer.   
 end

 # This method is to push animals either "dog" or "cat" into the linked list.
 def enqueue val
  @shelter.push(val)
  puts "Pushed \"#{val}\" into Animal Shelter".green
 end
 
 # Method for dequeuing any animal with oldest arrival time.
 def dequeueAny
  puts "Oldest animal is \"#{@shelter.shift}\"".yellow
  p @shelter
 end
 
 # Method to get the oldest Dog in animal shelter
 def dequeueDog	
  if @shelter.first == "dog"
   puts "Oldest #{@shelter.shift} is removed".cyan
   # Getting back any elements present inside buffer into shelter again.
   getBufferElements
   p @shelter 
  elsif @shelter.first == "cat"
   @buffer.push(@shelter.shift) # Putting elements from @shelter to @buffer.
   dequeueDog # Using Recursion untill we get any dog.
  else 
   puts "No Animals in shelter"
   return   
  end   
 end

 # Method to get the oldest Cat in animal shelter
 def dequeueCat
  if @shelter.first == "cat"
   puts "Oldest #{@shelter.shift} is removed".cyan
   # Getting back any elements present inside buffer into shelter again.
   getBufferElements
   p @shelter 
  elsif @shelter.first == "dog"
   @buffer.push(@shelter.shift) # Putting elements from @shelter to @buffer.
   dequeueCat # Using Recursion untill we get any dog.
  else 
   puts "No Animals in shelter".red
   return  
  end   
 end
 
 # Getting back the elements into shelter if there are any elements in buffer.
 def getBufferElements
  if @buffer.any?
  # Iterating the Buffer for elements
   @buffer.each do |f|
    @shelter.unshift(@buffer.pop) 
   end
  end
 end
  
end

@obj = AnimalShelter.new
@obj.enqueue "dog"
@obj.enqueue "cat"
@obj.enqueue "dog"
@obj.enqueue "cat"
@obj.dequeueCat
@obj.dequeueDog
@obj.dequeueDog
@obj.dequeueCat

