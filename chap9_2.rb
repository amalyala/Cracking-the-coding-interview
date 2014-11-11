# This program is to write a method to sort an array of strings so that all the anagrams are next to each other.
require 'colorize'

class Anagrams

 def initialize
  puts " Enter your strings seperated by a SPACE. \n Press \"Enter\" once finished .".yellow
  string = gets.chomp
  # Initializing array.
  @array = Array.new
  # Putting all strings into the array.
  string.split(" ").each do |f|
   @array << f
  end
  puts "\n Your array of string is ".yellow
  p @array
  askForConfirmation # Ask user for confirmation of his/her strings.       
 end
 
 # This method is to ask an user whether his/her entered strings are as expected.
 def askForConfirmation
  puts "\n Is the above strings are as you expected ? \n Press 'y' for yes or 'n' for no ".cyan
  confirmation = gets.chomp
  if confirmation == 'y'
    sortForAnagrams    # Call this method if user enter "yes"
  elsif confirmation == 'n'
    initialize # Call again.
  else 
   puts "Command not recognized".red
  end
 end
 
 # This method is called 
 def sortForAnagrams
  
 end
 

end

@ob = Anagrams.new


