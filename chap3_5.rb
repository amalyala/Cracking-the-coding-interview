# This program is to create Queue like functionality using two stacks.
require 'colorize'


class MyQueue
 attr_accessor :myQueue
 def initialize
  @i = 2
  @myQueue = Hash.new # Creating a hash to hold two stacks in place.
  @myQueue[1] = Array.new(3) # Creating first stack
  @myQueue[2] = Array.new(3) # Creating second stack, which works in reverse order   
 end

end

@obj = MyQueue.new
@obj.enqueue(5)
@obj.enqueue(6)
@obj.enqueue(7)
@obj.enqueue(8)
@obj.enqueue(9)
@obj.enqueue(10)
@obj.enqueue(11)
puts "-------------------"
puts "#{@obj.myQueue}".cyan
puts "-------------------"
