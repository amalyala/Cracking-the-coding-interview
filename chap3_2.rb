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
  @track_current_position = 0
 end
 
 # This is the push operation for the stack and it takes the input value to be pushed.
 def push(value)
  @stack[@current_position] = value
  # Once we push the value into the stack, we now verfiy whether new value pushed-
  # into the stack is greater than current "@min_value".
  if @stack[@min_value] > @stack[@current_position]
   @min_value = @current_position
   # As there is change in @min_value position, we will keep track of it in another stack @track_stack
   keep_track_of_min_value(@min_value)
  end
  @current_position += 1
 p @stack
 puts "Current position #{@current_position}"
 puts "Min_value position #{@min_value}"
 end
 
 # This method is called to keep track of @min_value whenever there is change in its position  
 def keep_track_of_min_value(min_value)
  @track_stack << min_value
  @track_current_position += 1  
 end
  
 # This is the pop operation for the stack and it pops the top element of the stack.
 def pop
  # Check for the end of Stack 
  if @current_position >= 0 
   # Check if popped element is the @min_value or not
   if @stack[@current_position-1] != @stack[@min_value]
    update_current_position
   elsif @stack[@current_position-1] == @stack[@min_value]
    puts "Popped Element is same as min_value".cyan
    # This method updates @min_value with previous value
    update_with_previous_min_value
    update_current_position
   end
  else
   puts "Stack is Empty" 
  end
 end
 
 # When popped element is also min_value, update new min_value pointer using track_stack record.
 def update_with_previous_min_value
  @track_stack.pop
  @track_current_position -= 1
  @min_value =  @track_stack[@track_current_position-1]  
 end
 
 # Updates the current_position pointer in @stack after pop
 def update_current_position
  @stack[@current_position-1] = nil
  @current_position -= 1  
 end
 
end

@obj = PushPopMinStack.new
@obj.push(9)
@obj.push(10)
@obj.push(7)
@obj.push(11)
@obj.push(6)
@obj.push(133)
@obj.push(5)
@obj.push(19)
@obj.pop
@obj.pop
@obj.pop
@obj.push(15)


