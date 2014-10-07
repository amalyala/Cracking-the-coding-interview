# This program is to design a stack in a such a way that it has push,pop,min operations-
# in it. Min method will give the minimum element in the stack. Each of this function-
# operate in constant O(1) time.

# This is a library to just give color to the text in the ruby console.
require 'colorize'

class PushPopMinStack
 
 # Initializing Stack and required values for our program.
 def initialize
  @stack = Array.new
  @track_stack = Array.new
  @min_value = 0
  @current_position = 0
 end
 
 # This is the push operation for the stack and it takes the input value to be pushed.
 def push(value)
  @value = value
  @stack[@current_position] = @value
  # Once we push the value into the stack, we now verfiy whether new value pushed-
  # into the stack is greater than current "@min_value".
  if @stack[@min_value] > @stack[@current_position]
   @min_value = @current_position
   # As there is change in @min_value position, we will keep track of it in another stack @track_stack
   keep_track_of_min_value
  end
  @current_position += 1
 end
 
 # This  
 def keep_track_of_min_value
 end
 
 
 # This is the pop operation for the stack and it pops the top element of the stack.
 def pop
 end
end

@obj = PushPopMinStack.new
@obj.push(4)
@obj.push(5)
@obj.push(6)
@obj.push(7)
@obj.push(2)
@obj.push(5)
@obj.push(7)
@obj.push(9)
@obj.push(1)

