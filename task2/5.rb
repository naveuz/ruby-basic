def leap_year?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

months = {
  "1" => 31,
  "2" => 28,
  "3" => 31,
  "4" => 30,
  "5" => 31,
  "6" => 30,
  "7" => 31,
  "8" => 31,
  "9" => 30,
  "10" => 31,
  "11" => 30,
  "12" => 31
}

puts "Введите день:"
day = gets.chomp.to_i

puts "Введите месяц:"
month = gets.chomp.to_i

puts "Введите год:"
year = gets.chomp.to_i

days = day

(1...month).each do |m|
  days += months[m.to_s]
end

days += 1 if leap_year?(year)

puts days
