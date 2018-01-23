puts "Введите a:"
a = gets.chomp.to_i

puts "Введите b:"
b = gets.chomp.to_i

puts "Введите c:"
c = gets.chomp.to_i

D = b**2 - 4 * a * c

x1 = (-b + Math.sqrt(D)) / (2 * a) if D >= 0
x2 = (-b - Math.sqrt(D)) / (2 * a) if D > 0

puts "D = #{D}, x1 = #{x1}, x2 = #{x2}" if D > 0
puts "D = #{D}, x1 = #{x1}" if D == 0
puts "D = #{D}, корней нет" if D < 0