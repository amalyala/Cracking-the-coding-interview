# This problem is to solve chapter 9, question 7 problem.
# In this problem we will solve circus tower problem.
require 'colorize'

class CircusTowerProblem
 def initialize
  # Constructing 2D array with 'height' and 'width' values given in question.
  @array = [[65,100],[70,150],[56,90],[75,190],[60,95],[68,110]]
  @max_seq_array = [] # We use this array to store all the found sequences.
  puts "\nGiven array is ".yellow
  p @array
  findMaxSequence # Method call to start solving.
 end
 
 # This method contains the logic for our problem.
 def findMaxSequence
  sortHeight # Sort by height.
  sortWeight # Then sort by weight.
  calculateMaxSequence # Calculating the maximum sequence allowed.
 end

 
 # Method to sort height of all humans.
 def sortHeight
  @array.sort_by! do |height,weight| 
   height # Sorting by height values
  end  
  puts "\nArray after sorting by height".cyan
  p @array
 end

 # Method to sort weight of all humans.
 def sortWeight
  @array.sort_by! do |height,weight| 
   weight # Sorting by weight values
  end  
  puts "\nArray after sorting by weight".cyan
  p @array
 end
 
 # In this method, we will now calculate the maximum sequence we can-
 # form traversing whole array.
 def calculateMaxSequence
  # initializing variables.
  sequence_length = 1
  count = 0
  height = 0
  weight = 0
  # Iterating over array and checking whether each height and weight is less than next ones.
  while count < @array.size-1 
  
   if @array[height][weight] <= @array[height+1][weight] # If height condition satisfies
    if @array[height][weight+1] <= @array[height+1][weight+1] # If weight condition also satisfies
     sequence_length += 1 # Increasing sequence counter
     height += 1
    end 
   elsif @array[height][weight] > @array[height+1][weight] # height doesnt satisfy condition. 
    @max_seq_array << sequence_length # Pushing the previously stored sequence length into our buffer array.
    sequence_length = 1 # Again starting with fresh sequnce_length
    height += 1 
   end 
   count += 1
  end

  puts "\n-------------------------------------------- ".green
  if !@max_seq_array.max.nil?  # If @max_seq_array is not nil.
   if @max_seq_array.max >= sequence_length # Taking the maximum among both
    puts "The maximum sequence found is '#{@max_seq_array.max}'".green
   elsif @max_seq_array.max < sequence_length
    puts "The maximum sequence found is '#{sequence_length}'".green
   end
  elsif @max_seq_array.max.nil?
   puts "The maximum sequence found is '#{sequence_length}'".green
  end
  puts "-------------------------------------------- ".green
 end
end

@obj = CircusTowerProblem.new

