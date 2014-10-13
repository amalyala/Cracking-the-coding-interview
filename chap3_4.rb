# This program is to solve towers of hanoi problem with 'N' number of disks.
# See wikipedia on to know exactly what is the problem.

class TowerOfHanoi
 attr_accessor :game_board
 
 def initialize(disks_count) 
  @no_of_disks = disks_count
  # Game board like -|-|-|-
  @game_board = Hash.new
  # Represent pegs 1,2,3 in game board.
  @game_board[1] = Array.new 
  @game_board[2] = Array.new
  @game_board[3] = Array.new
 end
 
 # This method is initiated to start the problem. 
 # This code is influenced from http://rosettacode.org/wiki/Towers_of_Hanoi in ruby language.
 def startThePuzzle(@no_of_disks,src= 0,dest= 2,aux= 1)
  if num_disks == 1
   @game_board[dest] << @towers[src].pop
    puts "Move disk from #{src} to #{dest} : #{@game_board}"
  else
    move(@no_of_disks-1, src, aux, dest)
    move(1, src, dest, aux)
    move(@no_of_disks-1, aux, dest, src)
  end 
-end
end

puts "Enter number of disks"
@disks_count = gets.to_i
@obj = TowerOfHanoi.new(@disks_count)
@obj.startThePuzzle
