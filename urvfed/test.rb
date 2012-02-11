#!/usr/bin/env ruby

if (ARGV.length != 1)
  puts "USAGE: ruby test.rb <number>"
  exit(1)
end

arg1= ARGV[0].to_i

if (arg1 <=0)
  puts "Argument must be positive."
  exit(1)
end


sqrt = Math.sqrt(arg1)

if (sqrt.to_i **2 != arg1)
  puts "Not perfect square."
  exit(1)
end

sequence = (1..arg1)

#  Начальная позиция
x = (sqrt-1) / 2
y = sqrt/2


max = 1

dirx = 1;
diry = -1;

state = 0



matrix = Array.new(sqrt).map!{Array.new(sqrt)}

step = 0
n = 0

# заполняем массив против часовой стрелки.
sequence.each do |symbol|
  if state == 0
    matrix[x][y] = symbol
    n+=1
    x += dirx
    if n == max
      state = 1
      n = 0
      dirx = -dirx
    end
  elsif state == 1
    matrix[x][y] = symbol
    n+=1
    y += diry
    if n == max
      state = 0
      n = 0
      max += 1
      diry = -diry
    end
  end
end


# Вывод на экран
for m in 0..(sqrt-1)
  for n in 0..(sqrt-1)
    print "#{matrix[n][m]}	"
  end
  puts
end
 
 