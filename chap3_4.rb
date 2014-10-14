# This program is to solve towers of hanoi problem with 'N' number of disks.
# See wikipedia on to know exactly what is the problem.
# LOGIC: 
# To move n discs from peg A to peg C:
# move n−1 discs from A to B. This leaves disc n alone on peg A
# move disc n from A to C
# move n−1 discs from B to C so they sit on disc n.

class TowerOfHanoi
 attr_accessor :game_board
 
 def initialize(disks_count) 
  @no_of_disks = disks_count
  # Game board like -|-|-|-
  @game_board = Hash.new
  # Represent pegs 1,2,3 in game board.
  @game_board[1] = (1..@no_of_disks).to_a.reverse
  @game_board[2] = Array.new
  @game_board[3] = Array.new
  startThePuzzle(@no_of_disks,source=1,destination=3,aux=2)
 end
 
 # This method is initiated to start the problem. 
 # This code is influenced from http://rosettacode.org/wiki/Towers_of_Hanoi in ruby language.
 def startThePuzzle(no_of_disks,source=1,destination=3,aux=2)
  puts "------------ #{source} #{destination} #{aux}--------------"
  if no_of_disks == 1
   @game_board[destination] << @game_board[source].pop
   puts "Moved disk from #{source} to #{destination} : #{@game_board}"
  else
   startThePuzzle(no_of_disks-1,source,aux,destination)
   startThePuzzle(1,source,destination,aux)
   startThePuzzle(no_of_disks-1,aux,destination,source)
  end 
 end
end

puts "Enter number of disks"
@disks_count = gets.to_i
@obj = TowerOfHanoi.new(@disks_count)
