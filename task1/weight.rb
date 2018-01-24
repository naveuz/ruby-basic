puts "Как ваше имя?"
name = gets.chomp

puts "Какой у вас рост?"
growth = gets.chomp.to_i

weight = growth - 110

if weight < 0
  puts "#{name}, ваш вес уже оптимальный"
else
  puts "#{name}, ваш идеальный вес #{weight}"
end
