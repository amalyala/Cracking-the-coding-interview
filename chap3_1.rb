# The problem scenario is to create 3 Stacks using single Array
# This gem is used to color the text in ruby console
require 'colorize'

class Chap3_1
 attr_accessor :array

 # Creating an initial values
 def initialize
  @array = Array.new(10, nil)
  @current_first_stack = 0
  @current_second_stack = @array.size - 1
  @current_third_stack = @array.size/2
  @initial_third_stack = @array.size/2
  @third_stack_pointer = @array.size/2
  @count = 0
  @counter = 1
 end
 
 # Push for the first stack
 def push_first_stack(value)
   puts "Pushing the element into First Stack ...".yellow
    # Check for available spot in array to push element
    if @array[@current_first_stack] == nil
	   @array[@current_first_stack] = value
	   # After inserting the values
	   # Update the current position of first stack 
       @current_first_stack = @current_first_stack + 1
    elsif @array[@current_first_stack] != nil
     puts "No Space for First Stack".red
    end 
    p @array
 end
 
  # Pop for the first stack
 def pop_first_stack
   puts "Popping the element from First Stack ...".yellow
   # Pop the element
    @array[@current_first_stack-1] = nil
    if @current_first_stack-1 == 0 
     @current_first_stack = 0 
    else
     @current_first_stack -= 1
    end
   p @array
 end

 # Push for the Second stack
 def push_second_stack(value)
   puts "Pushing the element into Second Stack ...".yellow
    # Check for available spot in array to push element
    if @array[@current_second_stack] == nil
	   @array[@current_second_stack] = value
	   # After inserting the value
	   # Update the current position of Second stack 
       @current_second_stack = @current_second_stack - 1
    elsif @array[@current_second_stack] != nil
     puts "No space for Second Stack".red
    end 
    p @array   
 end
 
 # Pop for the second stack
 def pop_second_stack
   puts "Popping the element from Second Stack ...".yellow
   # Pop the element
    @array[@current_second_stack+1] = nil
    if @current_second_stack+1 == @array.size-1 
     @current_second_stack = @array.size-1 
    else
     @current_second_stack += 1
    end
   p @array
 end
 
 # Push for the Third stack
 def push_third_stack(value)
  @value = value
  puts "Pushing the element into Third Stack ...".yellow
  # Third stack is initialized at the middle of the stack
  # Check for available spot in array to push element
  if @array[@current_third_stack] == nil
    @array[@current_third_stack] = @value
    # Updating current position of third stack 
    @current_third_stack +=  1
  elsif @array[@current_third_stack] != nil
    puts "Checking for Available space on the other side of Array".red
    sleep 2
    # Calling the function which will check the logic whether space,
    # if left for third stack on another side of array.
    # Here, We are sending the the stack size required as a parameter to the method
     check_for_available_space(@current_third_stack-@initial_third_stack, @value)
   end
  p @array
 end
 
  # Logic for checking whether there is available space 
  # for third stack on the other side of array
 
  def check_for_available_space(size_of_third_stack,value)
    @size_of_third_stack = size_of_third_stack
    @value = value
    # Logic to count for available free space for third stack
    @size_of_third_stack.times do
     @third_stack_pointer -= 1
     if @array[@third_stack_pointer] == nil
      @count += 1
     end     
    end 
    # Logic to check IF we have enough space
    if @count == @size_of_third_stack
     puts "YES there is enough space".green
     # This function is called to shift elements-
     # of one side to another side of array 
     shift_to_left_side(@size_of_third_stack, @value)
    else
     puts "NO there is enough space".red
    end
  end
  
 # This method is called to shift elements
 # from right side of array to left side if there is space.
  def shift_to_left_side(size_of_third_stack,value)
    @value = value
    @size_of_third_stack = size_of_third_stack
    @size_of_third_stack.times do 
     if @counter != @size_of_third_stack
      @array[@initial_third_stack-@counter] = @array[@initial_third_stack+@counter]
      @array[@initial_third_stack+@counter] = nil
      @counter += 1
     elsif @counter == @size_of_third_stack
      @array[@initial_third_stack-@counter] = @value
      @current_third_stack = @initial_third_stack-@counter-1 
      puts "#{@value} is now Pushed".cyan
    end 
   end
  end
  
 # Pop for the third stack
 def pop_third_stack
   puts "Popping the element from Third Stack ...".yellow
   # Pop the element
   @array[@current_third_stack-1] = nil
   if @current_third_stack-1 == @initial_third_stack 
    @current_third_stack = @initial_third_stack
    puts  "Stack is Empty".red
   else
    @current_third_stack += 1
   end
   p @array 
 end

end

 @obj = Chap3_1.new
 @obj.push_first_stack(1)
 @obj.push_first_stack(2)
 @obj.push_second_stack(9)
 @obj.push_second_stack(8)
 @obj.push_third_stack(3)
 @obj.push_third_stack(4)
 @obj.push_third_stack(5)
 @obj.push_third_stack(6)
 @obj.push_second_stack(7)
 @obj.push_first_stack(3)
