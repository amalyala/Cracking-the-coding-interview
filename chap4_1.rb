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
   findBalancedTree(@root) # Calling method to find whether binary tree is balanced or not.
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

 # This method is to find whether a binary tree is balanced or not.
 # In this method we traverse each node in binary tree using In-order traversal and -
 # for each node traversed, we find its left and right subtree heights.
 def findBalancedTree(current)
   # Base case for the recursion
   if current.nil?
    return
   end   
   # Get the height of left sub-tree of node
    left_height = getLeftSubtreeHeight(current.left)
   # Get the height of right sub-tree of node
    right_height = getRightSubtreeHeight(current.right)
   # Getting the difference of the two left and right subtrees
    difference = left_height - right_height
   # Find whether subtree heights differ more than 1
    if difference.abs > 1
     puts "Binary tree is not balanced".red
     return     
    end
    # Performing In-order traversal
    findBalancedTree(current.left)
  # print "--> #{current.value}".cyan  
    findBalancedTree(current.right)    
 end
 
 # Returning the height of left subtree
 def getLeftSubtreeHeight(current)
  if current.nil?
   return -1
  end
  height = getLeftSubtreeHeight(current.left)
  return height
 end
 
 # Returning the height of right subtree
 def getRightSubtreeHeight(current)
  if current.nil?
   return -1
  end
  height = getRightSubtreeHeight(current.right)
  return height
 end 
end 

@obj = BinaryTree.new
@obj.findBalancedTree






