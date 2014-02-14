class Chap1_1
def initialize(val)
@val= val
@left = 0
@right = (@val.size-1)
$count=0
end

def logic

while @left != @right 
if @val[@left] == @val[@right] then
$count = $count+1
@right= @right-1
else
@right= @right-1
end
end
@left= @left+1
@right = (@val.size-1)
if @left < @val.size-1
logic  #recursive
end


end
end

puts "Enter the string"
val= gets.chomp
ob=Chap1_1.new(val)
ob.logic
if $count > 0 then
puts " \n String doesnt have unique charectors"
else
puts " \nString has unique charectors"
end