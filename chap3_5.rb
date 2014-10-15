# This program is to create Queue like functionality using two stacks.
# Very simple logic to implement
require 'colorize'


class MyQueue
 attr_accessor :myQueue
 # In this constructor, we are creating two stacks and placing them inside hash for easy access.
 def initialize
  @myQueue = Hash.new # Creating a hash to hold two stacks.
  @myQueue[1] = Array.new # Creating first stack
  @myQueue[2] = Array.new # Creating second stack, which works in reverse order   
 end
 
 # This method is to insert elements into stack 1
 def enqueue(val)
   @myQueue[1] << val 
   puts "Enqueued value #{val} into Stack 1".green
end
 
 # Always dequeued from Stack 2
 def dequeue
 # Checking if stack 2 is empty? then shift elements from stack 1 to 2.
 # If stack 2 is not empty ? then directly pop elements from stack 2.
  if @myQueue[2].empty?
   shift_and_pop 
  elsif @myQueue[2].any? 
   popped =  @myQueue[2].pop
   puts "Dequeue element #{popped} from Stack 2".yellow
  end
 end
 
 # This method is called to shift all elements from stack 1 to stack 2.
 def shift_and_pop
  # Shifting every element of stack 1 into stack 2
  if @myQueue[1].size > 0 then 
   @myQueue[1].size.times do 
    @myQueue[2] << @myQueue[1].pop
   end
  else
   puts "No Elements to pop".red
   return
  end
  # After shifting, call dequeue again to pop the element.
  dequeue  
 end
end

@obj = MyQueue.new
@obj.enqueue(1)
@obj.enqueue(2)
@obj.enqueue(3)
@obj.dequeue
@obj.dequeue

puts "Final Values".cyan
puts "-------------------"
puts "#{@obj.myQueue}"
puts "-------------------"
