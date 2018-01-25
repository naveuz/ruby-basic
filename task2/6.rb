products = {}

loop do
  puts "Введите название товара:"
  product = gets.chomp

  break if product == "стоп"

  puts "Введите цену товара:"
  price = gets.chomp.to_i

  puts "Введите количество товара:"
  quantity = gets.chomp.to_f

  products[product] = {"price" => price, "quantity" => quantity}
end

puts products

total = 0

puts "Сумма за каждый товар:"

products.each do |key, value|
  amount = value["price"] * value["quantity"]
  total += amount
  puts "#{key}: #{amount}"
end

puts "Сумма итого: #{total}"
