# Program to check if there is a route between two give node values in an undirected graph.
require 'colorize'

# This class is to create node in the graph
class Node
 attr_accessor :value,:edges
 def initialize(value)
  @value = value
  @edges = []
  puts "Node #{value} is created".green
 end
end


class Graph
 def initialize
  @total_vertices = []
 end 

 # Creating vertices of the graph
 def enterVertices
  puts "Please enter number of vertices in your graph".cyan
  count = gets.chomp
  if count =~ /^\d+$/
   count.to_i.times do 
    puts "\nEnter the Vertex value".yellow
    addVertex(gets.chomp.upcase)
   end
  else
   puts "Invalid entry".red 
  end
 end
 
 # Creating edges of the graph
 def enterEdges
  puts "\nCreate a directed edge between source and destination.\nEnter the source value".yellow
  source = gets.chomp.upcase
  puts "Enter the destination value".yellow
  destination = gets.chomp.upcase
  addDirectedEdge(source,destination)
 end
 
 # Method to add vertex to the graph
 def addVertex(value)
  if !@total_vertices.include? value
   # Storing all the vertices inside an array
   @total_vertices << Node.new(value)
  end
 end
 
 # Method to add directed edge between two vertices
 def addDirectedEdge(source,destination)
   @total_vertices.each do |f|
    if f.value == source
     source = f
    end
   end
   @total_vertices.each do |f|
    if f.value == destination
     destination = f
    end
   end
   source.edges << destination
   puts "Directed Edge created between #{source.value} -> #{destination.value}".yellow
 end
 
 # This method is to find the list of neigbhouring vertices of a particular node
 def findNeighbours(find)
   if !find.nil?
    @total_vertices.each do |f|
     if f.value == find
      puts "Neibhouring vertices are ".green
      f.edges.each do |f| 
       puts f.value
      end
     end
    end
   else
    puts "Invalid entry".red
   end
 end
 
end

@obj = Graph.new
@obj.enterVertices
@obj.enterEdges
# Asking user to enter the node value to find its neigbhouring vertices
puts "\nPlease enter the vertex value to find its neighbouring edges".cyan
find = gets.chomp.upcase
@obj.findNeighbours(find)



 
