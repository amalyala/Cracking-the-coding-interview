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
  
  # This condition is to check for the first push of the stack and update @track_stack-
  # with the initial @min_value into the @track_stack
  if @current_position == 0
   keep_track_of_min_value(@min_value) 
  end
  # Once we push the value into the stack, we now verfiy whether new value pushed-
  # into the stack is greater than current "@min_value".
  if @stack[@min_value] > @stack[@current_position]
   @min_value = @current_position
   # As there is change in @min_value position, we will keep track of it in another stack called @track_stack
   keep_track_of_min_value(@min_value)
  end
  @current_position += 1
 end
 
 # This method is called to keep track of @min_value whenever there is change in its position  
 def keep_track_of_min_value(min_value)
  @track_stack << min_value
  @track_current_position += 1  
 end
  
 # This is the pop operation for the stack and it pops the top element of the stack.
 def pop
  # Check for the end of Stack 
  if @current_position-1 >= 0 
   # Check if popped element is the @min_value or not
   if @stack[@current_position-1] != @stack[@min_value]
    update_current_position
   elsif @stack[@current_position-1] == @stack[@min_value]
    # This method updates @min_value with previous min_value
    update_with_previous_min_value
    update_current_position
   end
  else
   puts "Cannot POP, Stack is Empty".red 
  end
 end
 
 # When popped element is also min_value, update new min_value pointer using track_stack record.
 def update_with_previous_min_value
  @track_stack.pop
  @track_current_position -= 1
  @min_value =  @track_stack[@track_current_position-1]  
  # If @min_value position has the starting point of stack
  if @min_value == nil
   @min_value = 0
  end
 end
 
 # Updates the current_position pointer in @stack after pop
 def update_current_position
  @stack[@current_position-1] = nil
  @current_position -= 1  
 end
 
 # This method gives us minimum value in the @stack
 def min
  if @stack[@min_value] != nil
   puts "Minimum value = #{@stack[@min_value]}".cyan
  elsif @stack[@min_value] == nil
   puts "No Minimum value. Stack is Empty".cyan
  end
 end
 
end

@obj = PushPopMinStack.new
@obj.push(63)
@obj.push(44)
@obj.push(66)
@obj.push(54)
@obj.push(645)
@obj.push(733)
@obj.push(99)
@obj.push(14)
@obj.push(14)
@obj.push(1)
@obj.pop
@obj.pop
@obj.push(14)
@obj.push(1)
@obj.push(1)
@obj.min

