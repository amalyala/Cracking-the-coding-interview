# This program is to tell whether a binary tree is balanced tree or not.
# Binary tree is supposed to be balanced when each node's height of left subtree and right subtree-
# does not exceed more than 1
require 'colorize'

# This class creates node.
class Node
 attr_accessor :value,:left,:right
 def initialize(value,left,right)
  @value = value
  @left = left
  @right = right 
  puts "Node with value #{@value} is created".green
 end
end

# This class implements binary tree using above Node class.
class BinaryTree
 def initialize
   @count = 0
   @node_values = [] # Array to store user entered node values
   ask_for_user_values # Method call
 end 

 def ask_for_user_values  
  puts "\nEnter the node values seperated by 'space'".yellow
  gets.chomp.split(" ").each do |f| 
   @node_values << f.to_i   # Storing each node value into array
  end
  puts "\nIs below array as per your expected node values?".yellow
  puts "1. Press 'y' for 'yes'\n2. Press 'r' for 're-enter'\n3. Press 'c' to cancel\n".yellow
  p @node_values
  answer = gets.chomp
  if answer.downcase == 'y'
   constructBinaryTree # If user says "yes" then we construct the binary tree
  elsif answer.downcase == 'r'
   @node_values = []
   ask_for_user_values
  elsif answer.downcase == 'c'
   return
  else
   puts "Invalid input".red
   return 
  end
 end
   
 # This method constructs binary tree with given values
 def constructBinaryTree
  @node_values.each_with_index do |value,index|
   if index == 0
    @root = Node.new(value,nil,nil) # Creating root node for the first element in array.
   else 
    add(value) # Creating child nodes.
   end
  end
 end

 # This method creates child nodes. 
 def add(val)
  current = @root  # Assigning 'current' to root node.
  while !current.nil?
   if current.left.nil? and current.right.nil? # If both left and right nodes are 'nil'
    current.send("#{['left','right'].sample}=", Node.new(val,nil,nil))  # Using 'send' method to randomly select either 'left' or 'right'
    break
   elsif !current.left.nil? and !current.right.nil? # If both left and right nodes are 'not nil'
    current = current.send("#{['left','right'].sample}")  
   elsif current.left.nil? and !current.right.nil? # If only left node is 'nil'
	current.left = Node.new(val,nil,nil)
	break
   elsif current.right.nil? and !current.left.nil? # If only right node is 'nil'
    current.right = Node.new(val,nil,nil)
    break
   end
  end
 end
 
 # This method asks user to enter value to "Find" a node in tree
 def callSearchMethod	
  puts "\nPlease Enter Node value to search".yellow
  find_element = gets.chomp
  # Checking if user hasnt entered anything.
  if find_element.nil?
   puts "Nothing to find".red
   return
  end
  found = searchNode(find_element,@root) # Method call to search the node, starting from root.
  if found > 0 
    puts "\nNode #{find_element} found in tree #{@count} times.".green
  elsif found == 0
    puts "\nNode #{find_element} not present in tree".red
  end
  @count = 0 # Reset the value
 end
 
 # Method to search the given value in our tree.
 # We use In-order traversal to in this method to find. 
 def searchNode(find_element,current)
  if current.nil?  # Base condition for recursive call.
   return
  end
  if find_element == current.value
   print "-->#{current.value}".cyan # If element is found
   @count += 1
  elsif find_element != current.value
   print "-->#{current.value}".yellow
  end
  searchNode(find_element,current.left)  # Recursive call for 'Left' subtree
  searchNode(find_element,current.right) # Recursive call for 'Right' subtree
  return @count
 end
 end 

@obj = BinaryTree.new







