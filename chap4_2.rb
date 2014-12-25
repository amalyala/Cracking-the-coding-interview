# Program to check if there is a route between two give node values in an undirected graph.
require 'colorize'

# This class is to create node in the graph
class Node
 def initialize(value)
  @value = value
  @edge = []
  puts "Vertice #{value} is created.".green
 end
end

class Graph
 def initialize
  vertices = []
  @total_vertices = []
 end
 
 # This method sets flow for creation of directed graph
 def directedGraph
  puts "\nPlease enter the Source vertice and Destination vertice seperated by 'comma'".cyan
  puts "Example: \"A,B\" creates an directed edge between A -> B".yellow
  response = gets.chomp.upcase
  vertices = response.split(',')
  createVertices(vertices) # Calling method to create vertices for the graph.
 end
 
 # This method sets flow for creation of un-directed graph
 def unDirectedGraph
 end

 def createVertices(vertices)
  # Creating vertices of directed graph
  vertices.each do |f|
   # Checking if vertice is already present in the graph
   if @total_vertices.include? f
    next
   # Checking if vertice is not present in the graph
   elsif !@total_vertices.include? f
    # We create vertice in the graph and then store in total_vertices array list to keep track of it
    Node.new(f)
   end
  end
 end
 
end

@obj = Graph.new
puts "\nWhat kind of graph are you trying to create ?\nPress 1 or 2 based on your response.".cyan
puts "1.Directed Graph".yellow
puts "2.Un-Directed Graph".yellow
response = gets.to_i
# Checking for the reponse of the user
if response == 1
 # Process for creating directed graph
 @obj.directedGraph
elsif response == 2
 # Process for creating un-directed graph
 @obj.unDirectedGraph
else
 # If user entered invalid response
 puts "Invalid response".red
end
