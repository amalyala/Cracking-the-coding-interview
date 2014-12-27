# Program to check if there is a route between two give node values in an undirected graph.
require 'colorize'
require 'set'

# This class is to create node in the graph
class Node
 attr_accessor :value,:edges
 def initialize(value)
  @value = value
  puts "Node #{value} is created".green
 end
end

# Creating a graph module such that its methods can be used in any required class.
class Graph
 attr_accessor :graphSet
 def initialize
  @graphSet = Hash.new
 end
 
 # Returns true or false based on the vertex already present in graph or not.
 def hasVertex(vertex_value)
   return @graphSet.has_key? vertex_value
 end
 
 # Method to add vertex to the graph
 def addVertex(vertex_value)
   if validateVertexPattern(vertex_value)
     @graphSet.merge!("#{vertex_value}" => [])
     return 1
   else
    puts "Invalid entry".red    
    return 0
   end
 end
 
 # Method to add directed edge between two given vertices
 def addDirectedEdge(edge_value)
  edge_vertices = []
  edge_vertices = edge_value.split(',')
  # Validate the user input
  if edge_vertices.size == 2
	source = edge_vertices[0]
	dest = edge_vertices[1]
	if !hasVertex(source)
		addVertex(source);
	end
	if !hasVertex(dest)
		addVertex(dest);
	end
	@graphSet.merge!("#{source}" => @graphSet.fetch(source)<< edge_vertices[1])
	
  else
   puts "Invalid entry".red
  end
 end
 
 # This method validates vertex's pattern
 def validateVertexPattern(to_match)
  # Pattern to check for special charectors
  pattern = /[A-Za-z]/   
  return to_match =~ pattern
 end
 
 
end


# Class for user functions 
class User

 def initialize
  # Initializing a graph instance
  @g = Graph.new   
 end
 
 def enterVertices
  loop do
   print "Enter vertex Value:".yellow
   vertex_value = gets.chomp.upcase
   if vertex_value != ''
    @g.addVertex(vertex_value)
   elsif vertex_value == ''
    break
   end
  end
 end
 
 def enterEdges
  puts "\nEnter edge between two vertices Eg: A,B".yellow
  loop do
   puts "Enter Vertices pair:".yellow
   edge_value = gets.chomp.upcase
   if edge_value != ''
    # Calling method to create edges
    @g.addDirectedEdge(edge_value)
   else
    break
   end
  end
 end
 
 def printGraph
	p @g.graphSet
 end
 def askForNeighbhours
 end
 
 def askForPath
 end

end

@u = User.new
@u.enterVertices
@u.enterEdges
@u.printGraph

=begin   
 # Checks if the graph has the given vertex
 def Graph.hasVertex(v)
    return @graphSet.any?{|a| a.value == v}
 end
 # Method to add directed edge between two given vertices
 def Graph.addDirectedEdge(edge_value)
  count = 0
  edge_pair = []
  edge_pair = edge_value.split(',')

  
  # Iterating over our vertices list to check if entered source vertice is present in our graph i.e. valid
	if (!hasVertex(edge_pair[0]) and !hasVertex(edge_pair[1])
		
	end

  if count == 0
   puts "Source vertex #{edge_pair[0]} does not exist in graph".red
  elsif count > 0
   count = 0
   # Iterating over our vertices list to check if entered Destination vertice is present in our graph i.e. valid
   @graphSet.each do |f|
    if f.value == edge_pair[1]
     count += 1    
    end
   end
   if count == 0
    puts "Destination vertex #{edge_pair[1]} does not exist in graph".red
   elsif count > 0
    # 
   end
  end
 end




count = 0
  # Storing all the vertices inside an array if its not present already in the graph
  @graphSet.each do |f|
   if f.value == node_value
    count += 1
   end
  end
   if count == 0
    @graphSet << Node.new(node_value)
   else
    puts "Node #{node_value} already present in graph".cyan
    count = 0
   end
=end
