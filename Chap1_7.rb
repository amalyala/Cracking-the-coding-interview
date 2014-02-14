class Chap1_7

def initialize(m,n)
@m = m
@n= n
@array= Array.new(@m){Array.new(@n)}
puts "\nArray with #{@m} * #{@n} dimension is created"
end

def add  # Adding elements into array
for @i in 0...@m
for @j in 0...@n
puts "\nEnter element for [#{@i}][ #{@j}]"
@val= gets.to_i
if @val == 0.to_i then
@row = @i
@col = @j
end
@array[@i][@j]=@val
@j=@j+1
end
@i=@i+1
end
puts "\n---> Final Array <---#{@array}"
end

def logic
column_up
column_down
row_up
row_down
puts "\nModified Array\n"
print @array

end

def column_up
@row1= @row
@col1 = @col
while @col1 < @n
@array[@row1][@col1]=0
@col1= @col1+1
end
end

def column_down
@row1= @row
@col1 = @col
while @col1 >= 0
@array[@row1][@col1]=0
@col1= @col1-1
end
end

def row_up
@row1= @row
@col1 = @col
while @row1 < @m
@array[@row1][@col1]=0
@row1= @row1+1
end
end

def row_down
@row1= @row
@col1 = @col
while @row1 >= 0
@array[@row1][@col1]=0
@row1= @row1-1
end
end

end

puts " \nTaking a Matrix of dimension M * N \n"
puts "--------------------------------------"

puts " \nEnter the value of M - dimension\n"
m= gets.to_i
puts " \nEnter the value of N - dimension\n"
n= gets.to_i
puts "--------------------------------------"
ob=Chap1_7.new(m,n)
ob.add
puts "\nFinding Any 0's in the matrix and making respective columns and rows 0's \n"
ob.logic