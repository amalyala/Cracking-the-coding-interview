class Node
attr_accessor :value,:next_node
def initialize(value,next_node)
@value = value.to_i
@next_node= next_node
puts "Initial node initialized with value #{@value}"
end

end


class Chap2_2

def initialize(val)
@head = Node.new(val,nil)
end

def count
@i = 1
current = @head
while current != nil
@i = @i+1
current = current.next_node
end
return @i

end


def add(val)
current = @head
while current.next_node != nil 
current = current.next_node
end
if current.next_node == nil then
current.next_node = Node.new(val,nil)
end

end

def find(val)
current = @head
@i=1
until @i == val							# finding Kth element in linked list
current = current.next_node
@i= @i+1
end

while current != nil 					# displaying from kth to last
print " #{current.value}--> "
current= current.next_node
end
puts "\n"



end

end

kk= Chap2_2.new(3)
kk.add(1)
kk.add(11)
kk.add(12)
kk.add(31)
max = kk.count
puts "\n"
puts "Enter the Kth value"
val= gets.to_i
if val > 0 and val <= max then
kk.find(val)
else
puts "Invalid Input"
end
