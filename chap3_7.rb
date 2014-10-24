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
  puts "Pushed value #{val} into Animal Shelter".green
  p @shelter
 end
 
 # Method for dequeuing any animal with oldest arrival time.
 def dequeueAny
  puts ""
  puts "Oldest animal is \"#{@shelter.shift}\"".yellow
  p @shelter
  puts ""
 end
 
 # Method to get the oldest Dog in animal shelter
 def dequeueDog	
  if @shelter.first == "dog"
   puts "Oldest Dog is removed #{@shelter.shift}".red
   # Getting back any elements present inside buffer into shelter again.
   getBufferElements
  elsif @shelter.first == "cat"
   @buffer.push(@shelter.shift) # Putting elements from @shelter to @buffer.
   dequeueDog # Using Recursion untill we get any dog.
  end   
 end

 # Method to get the oldest Cat in animal shelter
 def dequeueCat
  if @shelter.first == "cat"
   puts "Oldest Cat is removed #{@shelter.shift}".red
   # Getting back any elements present inside buffer into shelter again.
   getBufferElements
   p @shelter
  elsif @shelter.first == "dog"
   @buffer.push(@shelter.shift) # Putting elements from @shelter to @buffer.
   dequeueCat # Using Recursion untill we get any dog.
  end   
 end
 
 # Getting back the elements into shelter if there are any elements in buffer.
 def getBufferElements
  if @buffer.any?
   @buffer.each do |f|
    @shelter.unshift(f) 
   end
  end 
 end
  
end

@obj = AnimalShelter.new
@obj.enqueue "dog"
@obj.enqueue "cat"
@obj.enqueue "cat"
@obj.enqueue "dog"
@obj.enqueue "dog"
@obj.enqueue "cat"
@obj.dequeueCat
