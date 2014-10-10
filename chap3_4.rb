# This program is to solve towers of hanoi problem with 'N' number of disks.
# See wikipedia on to know exactly what is the problem.

class TowerOfHanoi
 def initialize(disks_count) 
  @no_of_disks = disks_count
  
 end
 
 # This method is initiated to start the problem. 
 def startThePuzzle
  
 end
 
end

puts "Enter number of disks"
@disks_count = gets.to_i
puts "Starting to Solve ..."
@obj = TowerOfHanoi.new(@disks_count)
@obj.startThePuzzle
