# This program is to sort a stack in ascending order using any number of required-
# stacks.
require 'colorize'

class AscendingSortStack
 attr_accessor :stack
 
 def initialize
  @i = 1
  @stack = Hash.new # Holding required stacks in one location.
  @stack[1] = Array.new # Stack which has to be sorted.
  @stack[2] = Array.new # Buffer stack
 end
 
 # Inserting elements into Stack 1 to sort. 
 def enqueue val
  @stack[@i] << val
  puts "Pushed #{val} into Stack 1".green
 end
 
 # This method initiates sorting of stack.
 def start_sorting
  first_operation_stack
  sorting_logic
 end
 
 # In this method we push Stack 1's first top element into Stack 2 as the first move of sorting.
 def first_operation_stack
  if @stack[@i].any?
   @stack[@i+1] << @stack[@i].pop
  elsif @stack[@i].empty?
   puts "Stack is empty".red
   return
  end
 end 
 
 # This method contains the logic to do the sorting.
 def sorting_logic
 # Perform this logic when Stack 1 is not empty.
  if @stack[@i].any?
  # If Stack 1 element is greater than Stack 2 ? Push Stack 1's top element directly into Stack 2
   if @stack[@i].last >= @stack[@i+1].last
     @stack[@i+1] << @stack[@i].pop
   # If Stack 1 element is less than Stack 2 ? Perform below logic.
   elsif @stack[@i].last < @stack[@i+1].last
     @temp = @stack[@i].pop
     keep_checking
     @stack[@i+1] << @temp
   end
   sorting_logic # Recursive call untill all elements in Stack 1 is empty.
   elsif @stack[@i].empty?
    puts "Your Stack is sorted ".cyan
    p @stack[@i+1]
  end
 end
 
 # This method is called to keep checking for elements in Stack 1 less than Stack 2.
 def keep_checking
 if @stack[@i+1].last != nil
  if @temp < @stack[@i+1].last
   @stack[@i] << @stack[@i+1].pop
   keep_checking # Recursive call untill Stack 2 is empty.
  elsif @temp > @stack[@i+1].last
   return
  end
 end
 end

end

@obj = AscendingSortStack.new
@obj.enqueue 1
@obj.enqueue 3
@obj.enqueue 3
@obj.enqueue 9
@obj.enqueue 13
@obj.enqueue 6
@obj.start_sorting
