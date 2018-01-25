def fib(n)
  n <= 1 ? n : fib(n - 1) + fib(n - 2)
end

array = []
index = 0

loop do
  f = fib(index)
  break if f > 100
  array << f
  index += 1
end

print array
