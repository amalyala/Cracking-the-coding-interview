# This program is to create Queue like functionality using two stacks.
# Very simple logic to implement
require 'colorize'


class MyQueue
 attr_accessor :myQueue
 # In this constructor, we are creating two stacks and placing them inside hash for easy access.
 def initialize
  @i = 1
  @size = 3  # Defining size of each stack
  @myQueue = Hash.new # Creating a hash to hold two stacks.
  @myQueue[1] = Array.new # Creating first stack
  @myQueue[2] = Array.new # Creating second stack, which works in reverse order   
 end
 
 # This method is to insert elements into stack 1
 def enqueue(val)
  if @myQueue[1].size <= @size
   @myQueue[1] << val 
  elsif @myQueue[1].size > @size
   puts "No Enought Space".red   
  end
end
 
 def dequeue
  if @myQueue[2].empty? 
   shift_first_to_second_stack 
  elsif @myQueue[2].any? 
   @myQueue[2].pop
  end
 end
 
 def shift_first_to_second_stack
  @myQueue[1].size.times do 
   @myQueue[2] << @myQueue[1].pop
  end
 dequeue
 end
 
end

@obj = MyQueue.new
@obj.enqueue(3)
@obj.enqueue(4)
@obj.enqueue(5)
@obj.dequeue

puts "-------------------"
puts "#{@obj.myQueue}".cyan
puts "-------------------"
