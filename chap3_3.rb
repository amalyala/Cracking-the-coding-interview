# SetOfStacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity.
# SetOfStacks.push() and SetOfStacks.pop() should behave identically to a single stack.

#This library is just to color the text in ruby console.
require 'colorize'

class SetOfStacks
 attr_accessor :stacks
 # Initializing Hash to hold all the stacks and initial stack is created.
 def initialize
  @stacks = Hash.new # declaring hash to hold all stacks
  @each_stack_size = 3 # defining each stack size
  @stack_number = 1 # Current stack number
  @stacks[@stack_number] = Array.new
 end
 
 # Push operation for the stack
 def push(value)
  # Checking if present stack is either full or not.
  if @stacks[@stack_number].size == @each_stack_size
   puts "Stack #{@stack_number} is Full. Creating another Stack ...".yellow
   # This method creates another stack and pushes the value into it.
   create_another_stack(value)
  elsif @stacks[@stack_number].size <= @each_stack_size
    @stacks[@stack_number] << value
  end
 end
 
 # This method is called to create another stack (as previous stack is filled)
 def create_another_stack(value)
  @stack_number += 1
  @stacks[@stack_number] = Array.new
  # Calling push method again once new stack is created.
  push(value)
 end
 
 # Pop operation for the stack
 def pop
  if @stacks[@stack_number].size == 0 and @stack_number-1 != 0
   puts "Stack #{@stack_number} is empty. Popping from previous Stack".yellow
   # This method is called once current stack is empty and to pop from previous stack
   call_previous_stack   
  elsif @stacks[@stack_number].size > 0
   puts "Popping ..."
   @stacks[@stack_number].pop   
  else
   puts "No elements to Pop" .red
  end     
 end
 
 # This method is called to call previous stack of the current stack
 def call_previous_stack
  @stack_number -= 1
  # Calling pop operation again
  pop  
 end
end

@obj = SetOfStacks.new
@obj.push(4)
@obj.push(5)
@obj.push(6)
@obj.push(7)
@obj.pop
@obj.pop
puts "----------------"
puts "Final Stack is ".green
p @obj.stacks
puts "----------------"

