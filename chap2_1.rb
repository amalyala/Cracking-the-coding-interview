class Node
attr_accessor :value,:next_node
def initialize(value,next_node)
@value = value.to_i
@next_node= next_node
puts "Initial node initialized with value #{@value}"
end

end

class LinkedList

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

def remove_duplicate()  # removing duplicates in linked list
puts "Removing Duplicates"
current= @head
current1 = current.next_node

while current.next_node != nil

while current1 != nil

if current.value == current1.value then
current1.value = current1.next_node.value
current1.next_node = current1.next_node.next_node
end
current1 = current1.next_node
end
current= current.next_node
current1= current.next_node
end

end

def display()
current= @head
while current.next_node != nil
print "#{current.value}-->"
current= current.next_node
end
puts "#{current.value}"
puts "\n"
end
end

ll= LinkedList.new(6)
ll.add(9)
ll.add(1)
ll.add(3)
ll.add(2)
ll.add(3)
ll.add(9)
ll.add(11)
print "\n Showing Linked List"
sleep(1)
print "." 
sleep(1)
print "." 
sleep(1) 
print ".\n\n"
ll.remove_duplicate()
ll.display()

