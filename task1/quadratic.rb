puts "Введите a:"
a = gets.chomp.to_i

puts "Введите b:"
b = gets.chomp.to_i

puts "Введите c:"
c = gets.chomp.to_i

D = b**2 - 4 * a * c

root = Math.sqrt(D)

if D > 0
  x1 = (-b + root) / (2 * a)
  x2 = (-b - root) / (2 * a)
  puts "D = #{D}, x1 = #{x1}, x2 = #{x2}"
elsif D == 0
  x1 = (-b + root) / (2 * a)
  puts "D = #{D}, x1 = #{x1}"
else
  puts "D = #{D}, корней нет"
end

