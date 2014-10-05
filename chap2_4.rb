# Class for a node 
class Node
 attr_accessor :val,:next_node
 def initialize(val,next_node)
  @val = val
  @next_node = next_node
  puts "New node with #{@val} is created." 
 end
end

# Class for the whole functionality using Node class for node creations.
class Chap2_4
 def initialize(val)
  @head = Node.new(val,nil)
 end
 
 # Adding nodes to the linked list
 def add_item(val)
  @current = @head
  while @current.next_node != nil
   @current = @current.next_node
  end
  @current.next_node = Node.new(val,nil)
 end
 
 # Finding the node which has loop
 def find_looped_node
  puts "Finding the looped item ..."
  sleep 3
  @slow_pointer = @head
  @fast_pointer = @head
  while @slow_pointer.val != @fast_pointer.next_node.val
   @slow_pointer = @slow_pointer.next_node   
   @fast_pointer = @fast_pointer.next_node.next_node
  end
  puts "#{@slow_pointer.val}" 
 end 
 
 # This function will create a node with loop to specified node
 def add_looped_item(val,loop_to)
  @current = @head
  while @current.next_node != nil
   if @current.val == loop_to
    @to_loop = @current 
   end
   @current = @current.next_node
  end
  @current.next_node = Node.new(val,@to_loop)
 end
 
end


obj = Chap2_4.new(5)
obj.add_item(3)
obj.add_item(1)
obj.add_item(8)
obj.add_item(4)
obj.add_looped_item(6,3)
obj.find_looped_node


