puts "Сторона a:"
a = gets.chomp.to_i

puts "Сторона b:"
b = gets.chomp.to_i

puts "Сторона c:"
c = gets.chomp.to_i

if a == b && b == c
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный."
else
  max, x, y = a, b, c if a > b && a > c
  max, x, y = b, a, c if b > a && b > c
  max, x, y = c, a, b if c > a && c > b

  if max**2 == x**2 + y**2
    puts "Треугольник прямоугольный."
  else
    puts "Треугольник не прямоугольный."
  end

  puts "Треугольник равнобедренный." if a == b || a == c || b == c
end





