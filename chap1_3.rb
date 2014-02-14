class Chap1_3

def initialize(val1,val2) # initialization part
@val1 = val1
@val2 = val2


if @val1.size == @val2.size then
@array = Array.new(@val1.size)
check(@val1,@val2) # calling the calculations function 
if @array.grep('a'..'z').empty? then
puts "Has permutation"
else
puts "Doesnt have Permutation" 
end

else
puts "Doesnt have Permutation" 
end
end

def check(val1,val2)

@val1 = val1
@val2= val2

for i in 0...@val1.size 			 # pushing values of first string into hash with '0' value
@array[i]= @val1[i]
i=i+1
end

for i in 0..@val1.size
for j in 0...@val2.size
if @array[i]== @val2[j] then
@array[i]='1'
@val2[j]='1'
else
j=j+1
end
end
i=i+1
end
end
end


puts "Enter your first string"
val1= gets.chomp
puts "Enter your second string"
val2= gets.chomp
Chap1_3.new(val1,val2)
