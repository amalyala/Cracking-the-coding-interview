class Chap1_5

def initialize 
@first=0
@last= 1
@i=0
@count=0
@array = Array.new()
@string = "aaaaaagaa".to_s
end

def check

while @last != @string.size-1

if @string[@first]==@string[@last] then
@last =@last+1
elsif @string[@first] != @string[@last]
@count= @last-@first
@array[@i] = @string[@first]
@i=@i+1
@array[@i] =@count
@i=@i+1
@first=@last
@last=@last+1
end

if @last == @string.size-1 then
@count= (@last-@first)+1
@array[@i] = @string[@first]
@i=@i+1
@array[@i] =@count
end

end
puts "\n Frequency print is"
p @array
puts "\n\n Smaller array is "

if @string.size > @array.size then
print @array
else
print @string
end

end
end

ob = Chap1_5.new
ob.check