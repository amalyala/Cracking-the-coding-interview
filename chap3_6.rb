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
   
 end

end 

@obj = AscendingSortStack.new
@obj.enqueue 5
@obj.enqueue 6
@obj.enqueue 3
@obj.enqueue 2
@obj.enqueue 9
@obj.start_sorting
p "#{@obj.stack}"
