# Program to check if there is a route between two give node values in an undirected graph.
require_relative '../Data-Structures-and-algorithms/dfs_graph'
require_relative '../Data-Structures-and-algorithms/bfs_graph'
require 'colorize'

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
			puts "Invalid entry. Enter only alphabets".red    
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
			addVertex(dest)
		end
		@graphSet.merge!("#{source}" => @graphSet.fetch(source)<< edge_vertices[1])
		else
			puts "Invalid entry. Enter only alphabets".red
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
	# Initialize method
	def initialize
		# Initializing a graph instance
		@g = Graph.new
	end
 
	# Asking user to enter the vertices for the graph
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
 
	# Asking user to enter the edges between the vertices
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
 
	# Method to print the hash set of the graph
	def printGraph
		p @g.graphSet
		return @g.graphSet
	end
end

@u = User.new
@u.enterEdges
@graphSet = @u.printGraph
@dfs = DfsGraph.new
@dfs.dfsAlgo(@graphSet)
@bfs = BfsGraph.new
@bfs.bfsAlgo(@graphSet)
