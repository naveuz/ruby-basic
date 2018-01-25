array = []

(10..100).each { |number| array << number if number % 5 == 0 }

print array
