# This program is to find a sub string inside another string.
# We will use Rabin-Karp algorithm to implement this i.e. using rolling hash mechanism.
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
  #starting and ending pointers of the @string
   @starting_pointer = 0
   @ending_pointer  = @starting_pointer + @pattern.size-1   
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
 
 # Main method to initiate the matching process
 def initiate_matching_process
  
  if @string_hash == @pattern_hash
   # Once we found that hashes match, we will start matching the charectors -
   # to make sure that charectors match and there is no hash collision.
   window_charector_match
  elsif @string_hash != @pattern_hash
   # Once there is no match, we should slide window
   # to one step right.
   slide_the_window
  end   
 end
 
 # This method is called to check for indivisual charectors-
 # once hashes are matched.
 def window_charector_match
  puts "match found"
 end
 
 # This method is called when both pattern hash and string window-
 # hash doesnt match and we have to slide the window with one charector.
 def slide_the_window
  puts "match Not found ..Sliding the window"
  @starting_pointer += 1
  puts @ending_pointer += 1
  # After we have slided the window of @string, Now we have to calculate-
  # the hash of it again. But as we are now using Rolling Hash mechanism-
  # we will do it in constant O(1) time.
   rolling_hash_for_new_window(@starting_pointer-1, @ending_pointer) 
 end
 
 # This method is called to perform rolling hash for the-
 # new window, based on the previous window in constant time.
 def rolling_hash_for_new_window(old_value, new_value)
   # Old/New value to be removed/Inserted from/into window.
   @new_value = new_value  
   @old_value = old_value
   # Step-1: Remove old value's hash value from our present window hash
   # Step-2: The resultant of above expression is divided by @base value
   # Step-3: New value's hash is added to the above expression's resultant. We finally get the new hash
  
   @string_hash = @string_hash - @string[@old_value].ord * @base**0   
   @string_hash /= @base   
   @string_hash = @new_hash + @string[@new_value].ord * @base**(@pattern.size-1)
   
 end
end

@obj = SubStringMatch.new
@obj.initiate_matching_process
