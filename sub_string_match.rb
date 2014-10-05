# This program is to find a sub string inside another string.
# We will use Rabin-Karp algorithm to implement this.
# This gem/library is used to color the text in console
require 'colorize'

class SubStringMatch

 # Initializing the initial variables required.
 def initialize  
  @string = "abcdbbca"
  @pattern = "bcd"
  @base  = 7
  @pattern_hash = 0
  @string_hash = 0
  # Pre-computing the hash of the pattern given
   compute_hash_of_pattern(@pattern)
  # Pre-computing the hash of the string for -
  # first few charectors of pattern length.
   compute_hash_of_string_of_pattern_size(@string)
 end
 
 # This method is called to compute the hash of -
 # the pattern given.
 def compute_hash_of_pattern(pattern)
  @pattern = pattern
  @pattern.each_char.with_index do |char,index|
   @pattern_hash = @pattern_hash + (char.ord * @base**index)
  end
  puts "Hash of the pattern is = #{@pattern_hash}".yellow
 end

 # This method is called to compute the hash of -
 # the string for the first few charectors of pattern length.
 def compute_hash_of_string_of_pattern_size(string)
  @string = string
  @string.each_char.with_index do |char,index|
   if index < @pattern.size
    @string_hash = @string_hash + (char.ord * @base**index)
   end
  end
  puts "Hash of the String for first few charectors of pattern length is = #{@string_hash}".green
 end
end



@obj = SubStringMatch.new
