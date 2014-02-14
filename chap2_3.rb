class Node

attr_accessor :value,:next_node

def initialize(value,next_node)
@value = value
@next_node = next_node
puts "Node #{@value} Initalized"
end

end

class Chap2_3

def initialize(val)
@head = Node.new(val,nil)
end

def add(value)
current = @head
while current.next_node != nil
current= current.next_node
end
current.next_node = Node.new(value,nil)
end

def delete_middle
current = @head
current1 = @head

while current1.next_node != nil
current = current.next_node
current1= current1.next_node.next_node
end
display(current)

end

def display(current1)
present = @head
current = current1

while present.value != current.value
print "#{present.value}-->"
present = present.next_node
end

current = current.next_node

while current.next_node != nil
print "#{current.value}-->"
current= current.next_node
end
print "#{current.value}\n"


end

end

ob=Chap2_3.new(4)
ob.add(3)
ob.add(7)
ob.add(1)
ob.add(6)
ob.add(8)
ob.add(11)
ob.add(12)
ob.add(31)
ob.add(122)
ob.add(110)
ob.delete_middle

