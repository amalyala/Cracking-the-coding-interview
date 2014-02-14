class Chap1_2

def initialize(val)
@val= val
@i=0
@first= 0
@last = 0

until @val[@i] == "\n"
if @val[@i] == "\s" then
@last = @last-1
reverse(@first,@last)
@first= @i+1
@i=@i+1
@last = @i
elsif @val[@i] != "\s"
@i=@i+1
@last = @i
end
if @val[@i] == "\n" then
@last = @last-1
reverse(@first,@last)
end
end
end

def reverse(first,last)
last.downto(first) do |i|
print @val[i]
end
print "\s"
end
end
puts "Enter the string"
val= gets
Chap1_2.new(val)
